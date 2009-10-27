class Admin::TypesController < Admin::BaseController
  
  def index
    @types = Type.find(:all)
  end
  
  def new
  end
  
  def create
    @type = Type.new(params[:type])
    respond_to do |format|
      if @type.save
        flash[:notice] = 'Created new Type of Development :'+@type.title
        format.html { redirect_to(admin_types_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
     @type = Type.find_by_id(params[:id])
  end
  
  def update
    @type = Type.find(params[:id])
     respond_to do |format|
       if @type.update_attributes(params[:type])
         flash[:notice] = 'type was successfully updated.'
         format.html { redirect_to(admin_types_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @type.errors, :status => :unprocessable_entity }
       end
     end
  end

  def destroy
      @type = Type.find(params[:id])
       @type.destroy

       respond_to do |format|
         format.html { redirect_to(admin_types_path) }
         format.xml  { head :ok }
       end
  end
end
