class AddFacilityIdstoProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :facility_ids, :string
  end

  def self.down
    remove_column :properties, :facility_ids
  end
end
