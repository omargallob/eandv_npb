class ServicesController < ApplicationController
  def index
    @page = Page.find_by_name('services')
    @subpages = @page.subpages
    @categories = Category.find_main
  end
  
  def show
    @page = Page.find_by_name('services')
    
    if params[:subcategory] == nil    
      @category = Category.find_by_name(params[:id])
    else
      @category = Category.find_by_name(params[:subcategory])
    end
    @categories = Category.find_main
    
      set_meta_tags :title =>  @page.title + " | " + @category.title,
                    :description => @category.description
    
  end 
end
