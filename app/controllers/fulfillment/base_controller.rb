class Fulfillment::BaseController < ApplicationController
  
  before_filter :require_fulfillment_user!
  
  def index
    @unprocessed_orders = Cart.unprocessed
    @processing_orders = Cart.processing
  end
  
end