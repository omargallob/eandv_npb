class AddPageIdtoPageFeaturedPhoto < ActiveRecord::Migration
  def self.up
      add_column :page_featured_photos, :page_id, :integer
  end

  def self.down
      remove_column page_featured_photos, :page_id
  end
end
