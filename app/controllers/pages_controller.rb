class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :store
  ]

  def home
  end
  
  def store
    @cart = Cart.new
    p Product.products_for_sale.count
    @cart.line_items.build
    @products = Product.products_for_sale
  end 
    
end
