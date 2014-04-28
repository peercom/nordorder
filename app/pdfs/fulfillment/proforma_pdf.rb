class Fulfillment::ProformaPdf < Prawn::Document

  def initialize(order)
    super()
    text "This is an proforma invoice"
  end
end