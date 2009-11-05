class AddMlsIdtoProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :mls_id, :integer
  end

  def self.down
    remove_column :properties, :mls_id
  end
end
