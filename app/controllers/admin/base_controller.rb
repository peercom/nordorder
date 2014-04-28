class Admin::BaseController < ApplicationController
  before_filter :require_admin!
  
  def index
    @last_orders = Cart.latest(10)
    p @last_orders
    @last_signins = User.last_signins(10)
    @count = User.users_count 
  end
end
