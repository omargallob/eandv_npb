class RssController < ApplicationController
  def index
      
  end

  def favs
     @favs = Page.find(:all, :conditions=>['featured=?',true])
      respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
  end

  def properties
      @properties = Property.find(:all, :include => 'location',:order => 'locations.region')
      respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
  end
end
