class MailWorker
  include Sidekiq::Worker

  def perform(cart)
    @cart = Cart.find(cart)
    CartMailer.fulfillment_email(@cart).deliver
  end
end