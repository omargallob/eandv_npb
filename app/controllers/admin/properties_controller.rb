class Admin::PropertiesController < Admin::BaseController
  def index
    @locations = Location.find(:all, :conditions => ['county=?','Orange'])
    @properties = Property.find(:all, :include => 'location',:order => 'locations.region')
     respond_to do |format|
         format.html # show.html.erb
         format.atom 
       end
  end

  def show
    @property = Property.find_by_id(params[:id])
    respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @property }
     end
  end

  def new
    @locations = Location.find(:all, :conditions => ['county=?','Orange'])
  end

  def create
     @property = Property.new(params[:property])
     @property.facility_ids = @property.facility_ids.split('-')

      respond_to do |format|
        if @property.save
          flash[:notice] = 'Created new property in  :'+@property.location.region+ " - ("+@property.location.state=")"
          format.html { redirect_to(admin_property_path(@property)) }
        else
          format.html { render :action => "new" }
        end
      end
  end

  def edit
    @property = Property.find_by_id(params[:id])
  end
  
  def update
    @property = Property.find(params[:id])
  
      respond_to do |format|
        if @property.update_attributes(params[:property])
      
          flash[:notice] = 'property was successfully updated.'
          format.html { redirect_to(admin_property_path(@property)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @format.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def destroy
    @property = Development.find(params[:id])
    @property.destroy

    respond_to do |format|
      flash[:notice] = 'Deleted property with id:'+@property.id.to_s
      format.html { redirect_to(admin_properties_path) }
      format.xml  { head :ok }
    end
  end
end
