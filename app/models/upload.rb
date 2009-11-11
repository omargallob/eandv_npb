class Upload < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :photo,
                      :styles => {
                        :thumb => ["120x90#", :jpg],
                        :pagesize => ["720x560>", :jpg],
                      },:processors => [:cropper],
                      :url => "/assets/property/gallery/:id/:style/:basename.jpg",
                      :path => ":rails_root/public/assets/property/gallery/:id/:style/:basename.jpg"
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h     
  
  acts_as_list :scope => :gallery
  
 # before_edit :reset_photo
  after_update  :reprocess_photo, :if => :cropping?
  
  def cropping?
     !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
   end  

   def photo_geometry(style = :original)
     @geometry ||= {}
     @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))
   end
  
   private
     def reprocess_photo
       photo.reprocess!
     end
     def reset_photo
       photo.reprocess!
     end
end
