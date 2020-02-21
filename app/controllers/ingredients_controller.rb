class IngredientsController < ApplicationController
  def index
    require "pry"; binding.pry
    if params[:id]
      @chef = Chef.find(params[:id])
      @ingredients = @chef.ingredients
    else
      @ingredients = Ingredient.all
    end
  end
end
