class CreateDevelopments < ActiveRecord::Migration
  def self.up
    create_table :developments do |t|
      t.string :title
      t.text :description
      t.integer :type_id
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :developments
  end
end
