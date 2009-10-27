class Admin::RolesController < Admin::BaseController
  def index
    @roles = Role.find(:all)
  end

  def new
  end
  
  def create
     @role = Role.new(params[:role])
  

      respond_to do |format|
        if @role.save
          flash[:notice] = 'Created new role in  :'+@role.name
          format.html { redirect_to(admin_roles_path) }
        else
          format.html { render :action => "new" }
        end
      end
  end

  def edit
    @role = Role.find_by_id(params[:id])
  end

  def update
    @role = Role.find(params[:id])
     respond_to do |format|
       if @role.update_attributes(params[:role])
         flash[:notice] = 'role was successfully updated.'
         format.html { redirect_to(admin_roles_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
       end
     end
  end

  def show
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      flash[:notice] = 'Deleted user with id:'+@role.id.to_s
      format.html { redirect_to(admin_roles_path) }
      format.xml  { head :ok }
    end
  end
end
