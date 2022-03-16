class UserMailer < ApplicationMailer
  
  #YR default mail adress can be modified
  default from: 'catshop@yopmail.fr'
 
  def order_email(user)
    @user = user
    @item = current_order.Item.find(params[:id]) # to be checked - YR - to be modified: id of the item bought by the user. Cf order_email views.

    #YR 16.03.2022 url to be modified (https://kittencat.herokuapp.com/)- we declare a new variable: @url. This variable will be used in the email view
    @url  = 'http://localhost:3000/login' 

    mail(to: @user.email, subject: 'Votre commande chez Catshop') 
  end
end
