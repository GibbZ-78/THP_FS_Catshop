class UserMailer < ApplicationMailer
  
  #YR default mail adress can be modified
  default from: 'jb.vidal@gmail.com'
 
  def order_email(order)
    @user = order.user
    @order = order
    @url  = 'https://kittencatshop.herokuapp.com/' 
    mail(to: @user.email, subject: 'Votre commande chez Catshop') 
  end

  def admin_email(order)
    @order = order
    mail(to: "adminvocal46@yopmail.com", subject: 'nouvelle commande réalisée')
  end
end
