class Property < ActiveRecord::Base
  belongs_to :location
  belongs_to :type
  has_and_belongs_to_many :facilities

  has_one :featured_photo
  has_one :gallery
  
  #has_many :facility_properties, :dependant => true
  #has_many :facilities,:through => :facility_properties
end
