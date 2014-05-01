class CartsController < ApplicationController
  
  def create
    @cart = Cart.new(params[:cart])
    @cart.user = current_user
    p @cart
    respond_to do |format|
      if @cart.save
        format.html { render(:notice => 'Cart was successfully created.') }
        format.xml  { render :xml => @cart, :status => :created, :location => @cart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cart.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def confirm
    @cart = Cart.find(params[:id])
    if params[:cart][:confirmed] == "1"
      @cart.update_attribute :confirmed, true
      CartMailer.fulfillment_email(@cart).deliver
      redirect_to(store_path, :notice => 'Order was placed successfully.')
    end    
  end
  
  private
  
    
  def cart_params
    params.require(:cart).permit(line_items_attributes: [:quantity, :article_id])
  end
  
end