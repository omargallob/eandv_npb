class Admin::LocationsController < Admin::BaseController
  
  def index
    @country = Country.find_by_country_initials(params[:country].upcase)
  end
  
  def new
    @country = Country.find_by_country_initials(params[:country].upcase)
  end
  
  def create
    @location = Location.new(params[:location])
    respond_to do |format|
      if @location.save
        flash[:notice] = 'Created Location :'+@location.id.to_s
        format.html { redirect_to(admin_country_path(@location.country.country_initials.downcase)) }
      else
 
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
      @location = Location.find_by_id(params[:id])
      @country = @location.country
  end
  
  def update
      @location = Location.find_by_id(params[:id])
       respond_to do |format|
         if @location.update_attributes(params[:location])
           flash[:notice] = 'location was successfully updated.'
           format.html { redirect_to(admin_country_path(@location.country.country_initials.downcase)) }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
         end
       end
  end 
  
  def destroy
      @location = Location.find(params[:id])
       @location.destroy

       respond_to do |format|
         format.html { redirect_to(admin_country_path(@location.country.country_initials.downcase)) }
         format.xml  { head :ok }
       end
  end
end
