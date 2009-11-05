class FeaturedPhoto < ActiveRecord::Base
  
  belongs_to :property
  belongs_to :page

   has_attachment :content_type => :image,
                  :max_size => 10.megabytes,
                  :path_prefix  => "public/images/featured/property",
                  :resize_to => [961,359],
                  :thumbnails => { :thumb => [134, 50] }                
    validates_as_attachment 
  
end
