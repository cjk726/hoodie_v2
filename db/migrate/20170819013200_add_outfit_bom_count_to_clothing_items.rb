class AddOutfitBomCountToClothingItems < ActiveRecord::Migration[5.0]
  def change
    add_column :clothing_items, :outfit_boms_count, :integer
  end
end
