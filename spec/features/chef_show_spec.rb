require 'rails_helper'

RSpec.describe "dchef's show page", type: :feature do
  context "as a visitor" do
    it "can see chefs name and a link to view all ingredients that this chef uses in their dishes" do

      chef1 = Chef.create!(name: "Matt")
      chef2 = Chef.create!(name: "Zeke")
      dish1 = chef1.dishes.create!(name: "Grilled Cheese", description: "Tasty")
      dish2 = chef2.dishes.create!(name: "Grilled Cheese", description: "Tasty")
      ingredient1 = dish1.ingredients.create!(name: "Bread", calories: 40)
      ingredient2 = dish1.ingredients.create!(name: "Cheese", calories: 60)
      ingredient3 = dish2.ingredients.create!(name: "Soup", calories: 10000000)

      visit "/chef/#{chef1.id}"
      expect(page).to have_content(chef1.name)
      expect(page).to_not have_content(chef2.name)
      click_link "Ingredients"
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to_not have_content(ingredient3.name)


    end
  end
end



# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
