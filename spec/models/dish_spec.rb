require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "methods" do
    it "total_calories" do
      chef1 = Chef.create!(name: "Matt")
      dish1 = chef1.dishes.create!(name: "Grilled Cheese", description: "Tasty")
      ingredient1 = dish1.ingredients.create!(name: "Bread", calories: 40)
      ingredient2 = dish1.ingredients.create!(name: "Cheese", calories: 60)

      expect(dish1.total_calories).to eq(100)
    end
  end
end
