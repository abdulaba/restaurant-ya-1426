class Restaurant < ApplicationRecord
  # Asociaciones
  belongs_to :user

  has_many :category_restaurants
  # restaurant = Restaurant.last => restaurant.category_restaurants
  has_many :categories, through: :category_restaurants, dependent: :destroy
  # restaurant = Restaurant.last => restaurant.categories

  #has_and_belongs_to_many :categories

  has_one_attached :photo
  has_one_attached :logo
  has_many :dishes

  # Validaciones
	validates :name, :address, length: { minimum: 6, message: "6 caracteres minimo" }
	validates :description, length: { minimum: 15, message: "15 caracteres minimo" }
  
  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # PG Search
  include PgSearch::Model
  
  pg_search_scope :global_search,
  against: [ :name, :description, :address ],
  associated_against: { # buscar en los modelos asociados
    categories: [ :name]
  },
  using: {
    tsearch: { prefix: true }
  }
end
