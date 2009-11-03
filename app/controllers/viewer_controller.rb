class ViewerController < ApplicationController
  def show
    @page = Page.find_by_name(params[:name])
    @subpages = @page.subpages
    if @page.metatag
      set_meta_tags :title =>  @page.title,
                  :description => @page.metatag.description,
                  :keywords =>  @page.metatag.keywords 
    else
      set_meta_tags :title =>  @page.title
    end  
  end

end
