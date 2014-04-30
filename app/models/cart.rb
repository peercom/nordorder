class Cart < ActiveRecord::Base
  attr_accessible :line_items_attributes
  
  STATE_OPEN = 0
  STATE_PROCESSING = 1
  STATE_FULFILLED = 2
  
  belongs_to :user
  has_many :line_items
  accepts_nested_attributes_for :line_items, reject_if: lambda {|attributes| attributes['quantity'].to_i == 0}
  
  def number_of_items
    self.line_items.sum(:quantity)
  end
  
  def total_value
    sum = Money.new(0)
    self.line_items.each do |item|
      sum += item.total_price
    end
    sum
  end
  
  def self.unprocessed
    Cart.where(:status => Cart::STATE_OPEN).where(:confirmed => true)
  end
  
  def self.processing
    Cart.where(:status => Cart::STATE_PROCESSING).where(:confirmed => true)
  end
  
  def self.latest(number)
    Cart.where(:confirmed => true).order(created_at: :desc).limit(number) 
  end
  
  def self.today
    where("created_at >= ?", Time.zone.now.beginning_of_day).where(:confirmed => true)
  end
  
  def self.yesterday
    where("created_at >= ? AND created_at <= ?", Time.zone.now.beginning_of_day - 1.day, Time.zone.now.end_of_day - 1.day).where(:confirmed => true)
  end
  
end
