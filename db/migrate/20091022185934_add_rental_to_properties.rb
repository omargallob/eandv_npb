class AddRentalToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :rental, :bool
  end

  def self.down
    remove_column :properties, :rental
  end
end
