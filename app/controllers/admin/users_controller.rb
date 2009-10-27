class Admin::UsersController < Admin::BaseController
  def index
    @users = User.find(:all,:order=>"login")
  end

  def new
      @user = User.new
  end

  def create
   params[:user][:role_ids] ||= [] 
    #logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      #self.current_user = @user # !! now logged in
      redirect_back_or_default(admin_users_path)
      #flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry."
      render :action => 'new'
    end
  end

  def edit
      @user = User.find(params[:id])
  end
  
  def update
     params[:user][:role_ids] ||= [] 
     @user = User.find(params[:id])
      respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'user was successfully updated.'
          format.html { redirect_to(admin_users_path) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
   end
  
  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      flash[:notice] = 'Deleted user with id:'+@user.id.to_s
      format.html { redirect_to(admin_users_path) }
      format.xml  { head :ok }
    end
  end
end
