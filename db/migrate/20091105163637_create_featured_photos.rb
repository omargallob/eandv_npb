class CreateFeaturedPhotos < ActiveRecord::Migration
  def self.up
    create_table :featured_photos do |t|
      t.column :page_id, :integer
      t.column :property_id, :integer
      t.column :size, :integer
      t.column :content_type, :string
      t.column :filename,     :string 
      t.column :width,     :integer 
      t.column :height,     :integer 
      t.column :parent_id,     :integer 
      t.column :thumbnail,  :string
      t.timestamps
    end
  end

  def self.down
    drop_table :featured_photos
  end
end
