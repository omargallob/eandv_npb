class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :living_areas
      t.integer :built
      t.integer :plot
      t.integer :garden
      t.integer :price
      t.bool :preferred
      t.integer :location_id
      t.integer :type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
