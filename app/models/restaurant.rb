class Restaurant < ApplicationRecord
  # Asociaciones
  belongs_to :user
  has_many :category_restaurants
  has_many :categories, through: :category_restaurants
  has_one_attached :photo
  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
