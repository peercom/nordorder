class Fulfillment::ProformaPdf < Prawn::Document

  def initialize(order)
    super()
    @order = order
    logo_left
    header_left
    header_right
    table_content
  end
  
  def logo_left
    bounding_box([0,710], :width => 200, :height => 80) do
      image "#{Rails.root}/public/bi_logo.png"
    end
  end
  
  def header_left
    bounding_box([0, 550], :width => 270, :height => 100) do
      text "Ship To:", size: 15, style: :bold
      text "Nordstrom #{@order.user.store}"
      text "#{@order.user.address}"
    end
  end
  
  def header_right
    bounding_box([400, 550], :width => 270, :height => 100) do
      text "Proforma", size: 15, style: :bold
      text "Order number: ##{@order.id}"
    end
  end
  
  def table_content
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [60, 60, 220, 200]
    end
  end
  
  def product_rows
    [['quantity', '#', 'Name', 'Desc']] + 
    @order.line_items.where.not(quantity: 0).map do |line_item|
      [line_item.quantity, line_item.product.sku, line_item.product.name, line_item.product.desc]
    end
  end  
    
end