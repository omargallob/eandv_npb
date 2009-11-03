class AddFeaturedtoPage < ActiveRecord::Migration
  def self.up
      add_column :pages, :featured, :bool
  end

  def self.down
    remove_column :pages, :featured
  end
end
