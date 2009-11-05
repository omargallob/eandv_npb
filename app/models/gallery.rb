class Gallery < ActiveRecord::Base
  belongs_to :property
  has_many :gallery_photos
end
