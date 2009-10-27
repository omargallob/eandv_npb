class CreateFacilitiesProperties < ActiveRecord::Migration
  def self.up
    create_table :facilities_properties, :id => false do |t|
      t.integer :facility_id
      t.integer :property_id
      t.integer :total
      t.timestamps
    end
  end

  def self.down
    drop_table :facilities_properties
  end
end
