class Admin::UploadsController < Admin::BaseController
  def edit
    @upload = Upload.find_by_id(params[:id])
  end
  
  def update
    @upload = Upload.find params[:id]
      if @upload.update_attributes params[:upload]
        flash[:notice] = 'Upload was successfully updated.'
        redirect_to admin_gallery_path(@upload.gallery)
      else
        render :action => "edit"
      end
    
  end

end
