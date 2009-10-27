class Facility < ActiveRecord::Base
  
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"
  
  has_and_belongs_to_many :properties
  #has_many :facility_properties, :dependant => true
  #has_many :properties,:through => :facility_properties
end
