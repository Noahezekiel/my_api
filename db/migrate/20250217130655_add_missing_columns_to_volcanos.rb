class AddMissingColumnsToVolcanos < ActiveRecord::Migration[8.0]
  def change
    add_column :volcanos, :country, :string
    add_column :volcanos, :latitude, :float
    add_column :volcanos, :longitude, :float
    add_column :volcanos, :elevation, :integer
    add_column :volcanos, :volcano_type, :string
    add_column :volcanos, :vei, :integer
    add_column :volcanos, :deaths, :integer
    add_column :volcanos, :injuries, :integer
    add_column :volcanos, :damage, :float
    add_column :volcanos, :houses_destroyed, :integer
    add_column :volcanos, :total_deaths, :integer
  end
end
