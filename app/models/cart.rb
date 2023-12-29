class Cart < ApplicationRecord
  has_many :line_items

  def add_product(dish) # dish => instancia de dish
    current_item = LineItem.find_by(dish_id: dish.id) # ) 0x635353 => true , nil
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(dish_id: dish.id, price: dish.price )
    end
    current_item
  end
end
