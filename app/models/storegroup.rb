class Storegroup < ActiveRecord::Base
  attr_accessible :name, :area
  has_many :users
  
  def self.search_and_order(search, page_number)
    if search
      where("name LIKE ?", "%#{search.downcase}%").order(name: :desc).page page_number
    else
      order(name: :desc).page page_number
    end
  end
  
end
