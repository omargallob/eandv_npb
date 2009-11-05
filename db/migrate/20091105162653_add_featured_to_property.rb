class AddFeaturedToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :featured, :bool
  end

  def self.down
    remove_column :properties, :featured
  end
end
