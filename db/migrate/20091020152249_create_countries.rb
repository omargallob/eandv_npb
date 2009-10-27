class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :title
      t.integer :measurment_id
      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
