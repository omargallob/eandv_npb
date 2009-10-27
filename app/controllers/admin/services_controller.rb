class Admin::ServicesController < Admin::BaseController
  def index
    @categories = Category.find_main
  end

  def new
  end

  def edit
  end

  def show
    @categories = Category.find_sub(params[:id])
  end

end
