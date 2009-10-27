class Admin::DevelopmentsController < Admin::BaseController
  def index
    @location = Location.find_by_zipcod(params[:zipcod])
  end
  
  def new
    @location = Location.find_by_zipcod(params[:zipcod])
  end
  
  def edit
    @location = Location.find_by_zipcod(params[:zipcod])
    @development = Development.find(params[:id])
  end
  
  def create
    @development = Development.new(params[:development])
    respond_to do |format|
      if @development.save
        flash[:notice] = 'Created new Development :'+@development.location.id.to_s
        format.html { redirect_to(admin_developments_path(@development.location.country.country_initials.downcase, @development.location.zipcod)) }
      else
        format.html { render :action => "new" }
      end
    end    
  end
  
  def update
    @development = Development.find(params[:id])
      respond_to do |format|
        if @development.update_attributes(params[:development])
          flash[:notice] = 'development was successfully updated.'
          format.html { redirect_to(admin_developments_path(@development.location.country.country_initials.downcase, @development.location.zipcod)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @format.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def destroy
    @development = Development.find(params[:id])
    @development.destroy

    respond_to do |format|
      flash[:notice] = 'Deleted development with id:'+@development.id.to_s
      format.html { redirect_to(admin_developments_path(@development.location.country.country_initials.downcase, @development.location.zipcod)) }
      format.xml  { head :ok }
    end
  end
end
