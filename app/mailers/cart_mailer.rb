class CartMailer < ActionMailer::Base
  default from: "nordstrom-orders@beverage-innovations.com"
  
  def fulfillment_email(cart)
    @cart = Cart.find(cart)
    mail(to: "holger.von.ameln@me.com", subject: "Received new order for #{@cart.user.store}")
  end
end
