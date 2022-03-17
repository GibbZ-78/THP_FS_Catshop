class CheckoutController < ApplicationController

  # Instantiating STRIPE payment funnel
  def create
    puts "INFO - Stripe - Starting payment funnel"
    @user = current_user
    puts "  > User: #{@user.first_name} #{@user.last_name} (user ID: #{@user.id})"
    @total = params[:total].to_d
    puts "  > Total amount: #{@total}"
    puts "  > Success URL: #{checkout_success_url} (eq. #{checkout_success_path})"
    puts "  > Cancel URL: #{checkout_cancel_url} (eq. #{checkout_cancel_path})"
    
    # Creating a dedicated "paiment_intent" Stripe object
    # @payment_intent = Stripe::PaymentIntent.create({
    #   amount: 2000,
    #   currency: 'eur',
    #   payment_method_types: ['card'],
    # })

    # Creating a dedicated "payment_method" Stripe object
    # @payment_method = Stripe::PaymentMethod.create({
    #   type: 'card',
    #   card: {
    #     number: '4242424242424242',
    #     exp_month: 3,
    #     exp_year: 2023,
    #     cvc: '314',
    #   },
    # })

    # Creating a dedicated "session" Stripe object using the above "payment_method"
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      # payment_method: @payment_method,
      line_items: [
        {
          name: "CatShop Payment of #{@user.first_name} #{@user.last_name}",
          amount: (@total*100).to_i,
          currency: "eur",
          quantity: 1
        },
      ],
      # payment_intent: @payment_intent,
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      #mode: "payment",
    )

    respond_to do |format|
      format.js   # Render views/checkout/create.js.erb
    end
    puts "INFO - Stripe - Closing payment funnel"
  end

  # Error encountered hence suppressing STRIPE payment tunnel
  def cancel
    puts "INFO - Stripe - Starting 'cancel' method"
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    puts "INFO - Stripe - Closing 'cancel' method"
  end

  # Went through STRIPE payment tunnel sucessfully
  def success
    puts "INFO - Stripe - Starting 'success' method"
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    # Manageing "Order" object creation from current_user's "Cart"
    @my_user = current_user
    @my_cart = Cart.find_by(user_id:@my_user.id)
    print "  > Creating 'order' from 'cart'"
    @my_order = Order.create(user_id: @my_user.id, order_date: Date.today, comment:"Created from cart nr. #{@my_cart.id} of #{@my_user.first_name} #{@my_user.last_name}", payment_method: "Card over Stripe")
    puts "... Done"
    @my_cart_items = CartItem.where(cart_id:@my_cart.id)
    print "  > Creating 'order items' from 'cart items'"
    @my_cart_items.each do |cart_item|
      print "  > Adding 1 'order item' from the 'cart'"
      OrderItem.create(order_id: @my_order.id, item_id: cart_item.id, quantity: cart_item.quantity, comment:"Created from item ref. #{cart_item.id} (#{cart_item.quantity}) in cart nr. #{@my_cart.id} of #{@my_user.first_name} #{@my_user.last_name}")
      print "...Done"
    end

    # Destroying current_user's "Cart" (+ "delete cascade" on related "CartItems")
    if @my_cart.items.count == @my_order.items.count
      @my_cart.destroy    # Destroy cart & cart_item only if number of items is the same
      puts "  > Destroying cart now backed-up into an order"
    else
      puts "  > ERROR - cart and order might not be synchronized..."
    end

    puts "INFO - Stripe - Closing 'success' method"

  end

end