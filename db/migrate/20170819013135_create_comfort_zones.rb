class CreateComfortZones < ActiveRecord::Migration
  def change
    create_table :comfort_zones do |t|
      t.string :comfort_zone_name
      t.integer :comfort_zone_temp_min

      t.timestamps

    end
  end
end
