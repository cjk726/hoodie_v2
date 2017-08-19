class AddOutfitCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :outfits_count, :integer
  end
end
