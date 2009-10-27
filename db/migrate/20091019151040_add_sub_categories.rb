class AddSubCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :parent_id, :integer
    add_column :categories, :navlabel, :string
    add_column :categories, :position, :integer
  end

  def self.down
      remove_column :categories, :parent_id
      remove_column :categories, :navlabel
      remove_column :categories, :position
  end
end
