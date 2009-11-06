class Gallery < ActiveRecord::Base
  belongs_to :property
  has_many :uploads,
           :attributes => true,
           :discard_if => proc { |upload| upload.photo_file_size.nil? }
end
