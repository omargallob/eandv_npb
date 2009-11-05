class Category < ActiveRecord::Base
  
  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'parent_id'

  has_attached_file :photo, :styles => {:small => "92x61#", :large => "961x359>"}, :processors => [:cropper],
                            :url => "/assets/categories/:id/:style/:basename.extension",
                            :path => ":rails_root/public/assets/categories/:id/:style/:basename.extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes                          
  #validates_attachment_content_type :content_type => ["image/jpeg","image/png"]
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h               
  after_update  :reprocess_photo, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end  
  
  def photo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))
  end
  
  def self.find_main
    Category.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
  end
  
  def self.find_sub(pid)
    Category.find(:all, :conditions => ['parent_id = ?', pid])
  end
  
  private
    def reprocess_photo
      photo.reprocess!
    end
  
end
