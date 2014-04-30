class Fulfillment::ProformaPdf < Prawn::Document

  def initialize(order)
    super()
    @order = order
    header_right
    table_content
  end
  
  def header_right
    y_position = cursor - 20
    bounding_box([400, y_position], :width => 270, :height => 100) do
      text "Proforma invoice", size: 15, style: :bold
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