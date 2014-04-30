class LineItem < ActiveRecord::Base
  attr_accessible :quantity, :product_id, :cart_id
  
  belongs_to :product
  belongs_to :cart
  
  def total_price
    product.price * quantity
  end

end
