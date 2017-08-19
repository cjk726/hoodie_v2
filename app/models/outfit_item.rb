class OutfitItem < ApplicationRecord
  # Direct associations

  belongs_to :clothing_item,
             :counter_cache => :outfit_boms_count

  belongs_to :outfit,
             :counter_cache => true

  # Indirect associations

  # Validations

end
