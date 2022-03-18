class CustomersController < ApplicationController
  # def index
  #   @customers =User.all
  # end

  def show
    @customer = User.find(params[:id])
  end

  def edit
    @customer = User.find(params[:id])
  end

  def update
    @customer = User.find(params[:id])
    post_params = params.require(:user).permit(:first_name, :last_name, :birthdate)
    @customer.update(post_params)
    redirect_to customer_path(@customer.id)
  end


end
