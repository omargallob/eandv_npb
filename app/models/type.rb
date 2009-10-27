class Type < ActiveRecord::Base
  has_many :developments
  has_many :properties
end
