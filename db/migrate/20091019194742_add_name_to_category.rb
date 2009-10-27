class AddNameToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :name, :string
  end

  def self.down
  end
end
