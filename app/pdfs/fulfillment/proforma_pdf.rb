class Fulfillment::ProformaPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper
  
  def initialize(order)
    super()
    @order = order
    logo_left
    ship_to
    bill_to
    cust_data
    header_right
    bounding_box([0, 350], :width => 540, :height => 200) do
      table_content
      totals_table
    end 
  end
  
  def logo_left
    bounding_box([0,710], :width => 170, :height => 100) do
      text "Beverage Innovations, Inc.", style: :bold
      text "955 NW 17th Ave"
      text "Building J"
      text "Delray Beach, FL 33445"
      text " "
      text "Voice: 561-665-8200"
      text "Fax: 561-665-8206"
    end
  end
  
  def ship_to
    bounding_box([270, 550], :width => 270, :height => 100) do
      text "Ship To:", size: 15, style: :bold
      text "Nordstrom #{@order.user.store}"
      text "#{@order.user.address}"
    end
  end
  
  def bill_to
    bounding_box([0, 550], :width => 230, :height => 100) do
      text "Bill To:", size: 15, style: :bold
      text "Nordstrom Stores #{@order.user.storegroup.name} #{@order.user.storegroup.area}"
      text "Nordstrom Corp AP"
      text "1700 7th ave suite 1000"
      text "Seattle, WA 98 101"
    end
  end
  
  def cust_data
    bounding_box([0, 450], :width => 540, :height => 100) do
      table cust_data_rows do
        row(0).font_style = :bold
        self.header = true
        self.row_colors = ['DDDDDD', 'FFFFFF']
        self.column_widths = [180, 180, 180]
      end
    end
  end
  
  def cust_data_rows
    [['Customer ID', 'Customer PO', 'Payment Terms'], ['Nordstrom 001-012', "#{@order.user.username}.#{@order.created_at.strftime('%m%d%y')}.#{@order.nth_order_for_day}", 'Net 30 days']]
  end
  
  def header_right
    bounding_box([390, 710], :width => 270, :height => 100) do
      text "INVOICE", size: 30, style: :bold
      text "Invoice number: NS" + "%06d" % @order.id
      text "Invoice date: #{@order.created_at.strftime('%b %d, %Y')}"
      text "PO date: #{@order.created_at.strftime('%b %d, %Y')}"
    end
  end
  
  def table_content
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [60, 60, 220, 100, 100]
    end
  end
  
  def totals_table
    indent 340 do
      table totals_rows do
        self.header = false
        self.column_widths = [100,100]
        row(2).font_style = :bold
      end
    end
  end
  
  def totals_rows
    [["Subtotal", "#{number_to_currency(@order.total_value)}"]] +
    [["Sales Tax", "$0.00"]] +
    [["TOTAL", "#{number_to_currency(@order.total_value)}"]]
  end
  
  def product_rows
    [['Quantity', 'Item', 'Desc', 'Unit Price', 'Amount']] + 
    @order.line_items.where.not(quantity: 0).map do |line_item|
      [line_item.quantity, line_item.product.sku, "#{line_item.product.name} #{line_item.product.desc}", number_to_currency(line_item.product.price_cents / 100), number_to_currency(line_item.product.price_cents * line_item.quantity / 100)]
    end
  end  
    
end