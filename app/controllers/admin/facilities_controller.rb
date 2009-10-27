class Admin::FacilitiesController < Admin::BaseController
  def index
   # @property = Property.find_by_id(params[:property_id])
   @facilities = Facility.find(:all,:order => 'title')
  end

  def new
   # @property = Property.find_by_id(params[:property_id])
  end

  def create
     @facility = Facility.new(params[:facility])
     respond_to do |format|
       if @facility.save
         flash[:notice] = 'Created new Type of Facility :'+@facility.title
         format.html { redirect_to(admin_facilities_path) }
       else
         format.html { render :action => "new" }
       end
     end
   end

  def edit
      @facility = Facility.find_by_id(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
     respond_to do |format|
       if @facility.update_attributes(params[:facility])
         flash[:notice] = 'facility was successfully updated.'
         format.html { redirect_to(admin_facilities_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @facility.errors, :status => :unprocessable_entity }
       end
     end
  end

  def show
  end
  
  def destroy
      @facility = Facility.find(params[:id])
       @facility.destroy

       respond_to do |format|
         format.html { redirect_to(admin_facilities_path) }
         format.xml  { head :ok }
       end
  end


end
