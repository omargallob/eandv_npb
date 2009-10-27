class Development < ActiveRecord::Base
  belongs_to :location
  belongs_to :type
end
