class AddCountryInitialsToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :country_initials, :string
  end

  def self.down
    remove_column :countries, :country_initials
  end
end
