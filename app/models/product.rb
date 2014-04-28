class Product < ActiveRecord::Base
  
  attr_accessible :sku, :name, :price_cents, :desc, :price
  
  monetize :price_cents
  
  def self.products_for_sale
    find(:all, :order => 'sku')
  end
  
  def self.search_and_order(search, page_number)
    if search
      where("name LIKE ?", "%#{search.downcase}%").order(name: :desc).page page_number
    else
      order(name: :desc).page page_number
    end
  end
  
  
end
