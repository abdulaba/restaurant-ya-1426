class RestaurantsController < ApplicationController
  
  # GET /restaurants 
  def index
      if params[:query].present? # "aires"
        @restaurants = Restaurant.global_search(params[:query])
      else
        @restaurants = Restaurant.all
      end
       
  end

  # GET /restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # GET /restaurants/new
  def new # Vista del new.html.erb
    @restaurant = Restaurant.new
    @categories = Category.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # /restaurants/:id/edit
  def edit # Vista del edit.html.erb
    @restaurant = Restaurant.find(params[:id])
    @categories = Category.all
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  # GET /my_restaurants
  def my_restaurants
    @restaurants = Restaurant.where(user_id: current_user.id)
  end

  private 
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :photo, category_ids: [])
  end
end
