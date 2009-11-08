class AddPositionTitleToUpload < ActiveRecord::Migration
  def self.up
     add_column :uploads, :position, :integer
     add_column :uploads, :title, :string
  end

  def self.down
    remove_column :uploads, :position
    remove_column :uploads, :title
  end
end
