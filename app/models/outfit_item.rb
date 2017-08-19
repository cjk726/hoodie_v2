class OutfitItem < ApplicationRecord
  # Direct associations

  belongs_to :outfit,
             :counter_cache => true

  # Indirect associations

  # Validations

end
