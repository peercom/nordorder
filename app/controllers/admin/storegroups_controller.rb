class Admin::StoregroupsController < Admin::BaseController
  
  def index
    @storegroups = Storegroup.search_and_order(params[:search], params[:page])
  end
  
  def new 
    @storegroup = Storegroup.new
  end
  
  def edit
    @storegroup = Storegroup.find(params[:id])
  end
  
  def update
      @storegroup = Storegroup.find(params[:id])

      respond_to do |format|
        if @storegroup.update_attributes(params[:storegroup])
          format.html { redirect_to(admin_storegroups_path, :notice => 'Storegroup was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @storegroup.errors, :status => :unprocessable_entity }
        end
      end
    end
  
  def create
    @storegroup = Storegroup.new(params[:storegroup])

    respond_to do |format|
      if @storegroup.save
        format.html { redirect_to(admin_storegroups_path, :notice => 'Storegroup was successfully created.') }
        format.xml  { render :xml => @storegroup, :status => :created, :location => @storegroup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @storegroup.errors, :status => :unprocessable_entity }
      end
    end
  end

end