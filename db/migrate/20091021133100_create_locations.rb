class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :state
      t.string :county
      t.string :region
      t.string :other
      t.string :zipcod
      t.integer :country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
