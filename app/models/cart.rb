class Cart < ActiveRecord::Base
  attr_accessible :line_items_attributes
  
  belongs_to :user
  has_many :line_items
  accepts_nested_attributes_for :line_items, reject_if: lambda {|attributes| attributes['quantity'].blank?}
  
  def number_of_items
    self.line_items.sum(:quantity)
  end
  
  def total_value
    #TODO implement
    10
  end
  
end
