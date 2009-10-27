class AddAddressToProperties < ActiveRecord::Migration
  def self.up
      add_column :properties, :address, :text
  end

  def self.down
    remove_column :properties, :address
  end
end
