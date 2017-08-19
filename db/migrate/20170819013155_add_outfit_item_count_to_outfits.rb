class AddOutfitItemCountToOutfits < ActiveRecord::Migration[5.0]
  def change
    add_column :outfits, :outfit_items_count, :integer
  end
end
