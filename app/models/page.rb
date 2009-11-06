class Page < ActiveRecord::Base
  
  has_one :metatag
  has_one :page_featured_photo,:foreign_key => 'page_id'
  
  has_many :subpages, :class_name => 'Page', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Page', :foreign_key => 'parent_id'
  
  has_attached_file :thumb, :styles => {:small => "120x90#", :large => "961x359>"}, :processors => [:cropper],
                            :url => "/assets/page/:id/thumb/:style/:basename.extension",
                            :path => ":rails_root/public/assets/page/:id/thumb/:style/:basename.extension"

  validates_attachment_presence :thumb
  validates_attachment_size :thumb, :less_than => 5.megabytes
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h               
  after_update  :reprocess_thumb, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end  
  
  def thumb_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(thumb.path(style))
  end
  
  def self.find_main
    Page.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
  end
  private
    def reprocess_thumb
      thumb.reprocess!
    end
 # auto_html_for :body do
 #     html_escape
 #     image
 #    youtube :width => 400, :height => 250
 #     link :target => "_blank", :rel => "nofollow"
 #   simple_format
 #  end
end
