require 'rails_helper'

RSpec.describe "dish's show page", type: :feature do
  context "as a visitor" do
    it "can see the chef that made the dish and list of ingredients for that dish" do

      chef1 = Chef.create!(name: "Matt")
      dish1 = chef1.dishes.create!(name: "Grilled Cheese", description: "Tasty")
      # ingredient1 = dish1.ingredients.create!(name: "Bread")
      # ingredient2 = dish1.ingredients.create!(name: "Cheese")

      visit "/dish/#{dish1.id}"
      expect(page).to have_content(dish1.name)
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)

    end
  end
end


# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the name of the chef that made that dish
# And I see a list of ingredients for that dish
