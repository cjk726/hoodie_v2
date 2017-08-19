class AddOutfitCountToComfortZones < ActiveRecord::Migration[5.0]
  def change
    add_column :comfort_zones, :outfits_count, :integer
  end
end
