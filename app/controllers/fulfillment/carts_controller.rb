class Fulfillment::CartsController < Fulfillment::BaseController
  
  def show
    @cart = Cart.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Fulfillment::ProformaPdf.new(@cart)
        filename = "INV" + "%06d" % @cart.id + ".pdf"
        send_data pdf.render, filename: filename, type: 'application/pdf'
        #@cart.update_attribute :status, Cart::STATE_PROCESSING
      end
    end
  end
  
  def mark_as_processing
    @cart = Cart.find(params[:id])
    @cart.update_attribute :status, Cart::STATE_PROCESSING
    redirect_to fulfillment_root_path
  end
  
  def revert
    @cart = Cart.find(params[:id])
    @cart.update_attribute :status, Cart::STATE_OPEN
    redirect_to fulfillment_root_path
  end
  
  def mark_as_fulfilled
    @cart = Cart.find(params[:id])
    @cart.update_attribute :status, Cart::STATE_FULFILLED
    redirect_to fulfillment_root_path
  end
  
end