class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :dish
end
