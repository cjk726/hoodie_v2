class Outfit < ApplicationRecord
  # Direct associations

  belongs_to :comfort_zone,
             :counter_cache => true

  has_many   :outfit_items,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
