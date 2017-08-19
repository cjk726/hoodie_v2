class ClothingItem < ApplicationRecord
  # Direct associations

  has_many   :outfit_boms,
             :class_name => "OutfitItem",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
