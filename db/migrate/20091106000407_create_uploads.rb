class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :description
      t.integer :dog_id
      t.string :photo_file_name
      t.integer :photo_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
