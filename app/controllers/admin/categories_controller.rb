class Admin::CategoriesController < Admin::BaseController
  def index
  end

  def show
      @categories = Category.find_sub(params[:id])
      #@subcategories = @category.subcategories
      @parent = Category.find_by_id(params[:id])
  end

  def new
  end

  def create
    @cat = Category.new(params[:category])
    
    respond_to do |format|
      if @cat.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to(admin_services_path) }
        format.xml  { render :xml => @cat, :status => :created, :location => @cat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update 
     @category = Category.find(params[:id])

     respond_to do |format|
       if @category.update_attributes(params[:category])
         flash[:notice] = 'Category was successfully updated.'
         format.html { redirect_to(admin_category_path(@category.parent)) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
       end
     end
  end

   def destroy
     @category = Category.find(params[:id])
     @category.destroy

     respond_to do |format|
       format.html { redirect_to(admin_services_path) }
       format.xml  { head :ok }
     end
   end

end
