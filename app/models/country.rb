class Country < ActiveRecord::Base
  has_many :locations
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"
end
