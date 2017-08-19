class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.integer :user_id
      t.integer :comfort_zone_id

      t.timestamps

    end
  end
end
