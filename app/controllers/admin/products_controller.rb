class Admin::ProductsController < Admin::BaseController
  
  def index
    @products = Product.search_and_order(params[:search], params[:page])
  end
  
  def new 
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
      @product = Product.find(params[:id])

      respond_to do |format|
        if @product.update_attributes(params[:product])
          format.html { redirect_to(admin_products_path, :notice => 'Product was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
        end
      end
    end
  
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(admin_products_path, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

end