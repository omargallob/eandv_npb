class Admin::GalleriesController <  Admin::BaseController
  def index
  end

  def show
    @gallery = Gallery.find_by_id(params[:id])
    @uploads = @gallery.uploads.find(:all,:order => "position")
    # @property -@gallery.property
  end

  def new
    @property = Property.find_by_id(params[:property_id])
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new params[:gallery]

       if @gallery.save
         flash[:notice] = 'gallery was successfully created.'
         redirect_to admin_gallery_path(@gallery)
       else
         render :action => "new"
       end
  
  end
  
  def edit
    @gallery = Gallery.find_by_id(params[:id])
  end
  
  def update
    @gallery = Gallery.find_by_id(params[:id])
       respond_to do |format|
         if @gallery.update_attributes(params[:gallery])
          flash[:notice] = 'gallery was successfully UPDATED.'
          format.html {
               flash[:notice] = 'gallery was successfully updated.'
               redirect_to(admin_gallery_path(@gallery))
          }
        else
          render :action => "edit"
        end
      end
  end
  
  def destroy
    @gallery = Gallery.find_by_id(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "galleries",:action=>"new",:property_id=>@gallery.property.id) }
      format.xml  { head :ok }
    end
  end
  
  def prioritize_uploads
    gallery = Gallery.find(params[:id])
    uploads = gallery.uploads
    uploads.each do |upload|
      upload.position = params['image'].index(upload.id.to_s) + 1
      upload.save
    end
    render :nothing => true
  end
end
