class LineItemsController < ApplicationController
before_action :set_cart, only: :create # @cart => una instancia de Cart

  def create
    dish = Dish.find(params[:dish_id]) 
    @line_item = @cart.add_product(dish)
    if @line_item.save
      redirect_to cart_path(@cart.id)
    end
  end
end
