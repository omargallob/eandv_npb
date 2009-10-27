class Admin::CountriesController < Admin::BaseController
  def index
    @countries = Country.find(:all)
  end

  def show
    @country = Country.find_by_id(params[:id])
  end

  def new
  end

  def create
     @country = Country.new(params[:country])
     respond_to do |format|
       if @country.save
         flash[:notice] = 'Country <i>'+@country.title+'</i> was created.'
         format.html { redirect_to(admin_country_path(@country.country_initials.downcase)) }
       else
         format.html { render :action => "new" }
       end
     end
  end

  def edit
    @country = Country.find_by_id(params[:id])
  end

  def update
    @country = Country.find(params[:id])
     respond_to do |format|
       if @country.update_attributes(params[:country])
         flash[:notice] = 'country was successfully updated.'
         format.html { redirect_to(admin_country_path(@country.country_initials.downcase)) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
       end
     end
  end

  def destroy
      @country = Country.find(params[:id])
       @country.destroy

       respond_to do |format|
         format.html { redirect_to(admin_countries_path) }
         format.xml  { head :ok }
       end
  end

end
