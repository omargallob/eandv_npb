class CreateFacilities < ActiveRecord::Migration
  def self.up
    create_table :facilities do |t|
      t.column  :title, :string
      t.column :number, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :facilities
  end
end
