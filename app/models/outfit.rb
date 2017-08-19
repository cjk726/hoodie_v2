class Outfit < ApplicationRecord
  # Direct associations

  has_many   :outfit_items,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
