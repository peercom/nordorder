class Admin::ProductsController < Admin::BaseController
  before_action :set_user, only: [
    :show,
    :edit,
    :update,
    :destroy
  ]
  
  def index
    @products = Product.search_and_order(params[:search], params[:page])
  end

end