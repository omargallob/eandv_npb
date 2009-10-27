class Admin::OverviewController < Admin::BaseController
 
  def index
    @pages = Page.find(:all)
    @categories = Category.find_main
    @countries = Country.find(:all)
    @facilities = Facility.find(:all)
    @properties = Property.find(:all)
  end
end
