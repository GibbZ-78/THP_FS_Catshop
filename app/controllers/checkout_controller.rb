class CheckoutController < ApplicationController

  # Instantiating STRIPE payment funnel
  def create
    puts "DEBUG - Stripe - Starting payment funnel"
    @user = current_user.id
    puts "  > User: #{@user.first_name} #{@user.last_name} (user ID: #{@user.id})"
    @total = params[:total].to_d
    puts "  > Total amount: #{@total}"
    puts "  > Success URL: #{checkout_success_url} (eq. #{checkout_success_path})"
    puts "  > Cancel URL: #{checkout_cancel_url} (eq. #{checkout_cancel_path})"
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items: [
        {
          name: "CatShop Payment of #{@user.first_name} #{@user.last_name}",
          amount: (@total*100).to_i,
          currency: "eur",
          quantity: 1
        }
      ],
      success_url: checkout_success_url + "?session_id{CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url 
    )
    respond_to do |format|
      format.js   # Render views/checkout/create.js.erb
    end
    puts "DEBUG - Stripe - Closing payment funnel"
  end

  # Error encountered hence suppressing STRIPE payment tunnel
  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  # Went through STRIPE payment tunnel sucessfully
  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    # Manageing "Order" object creation
    @user = current_user.id
    
  end

end
