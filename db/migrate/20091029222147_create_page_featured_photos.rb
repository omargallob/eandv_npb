class CreatePageFeaturedPhotos < ActiveRecord::Migration
  def self.up
    create_table :page_featured_photos do |t|
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
    drop_table :page_featured_photos
  end
end
