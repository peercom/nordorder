class Fulfillment::CartsController < Admin::BaseController
  
  before_filter :require_fulfillment_user!
  
  def show
    @cart = Cart(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ProformaPdf.new(@cart)
        send_data pdf.render, filename: 'proforma.pdf', type: 'application/pdf'
      end
    end
  end
  
end