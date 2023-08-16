require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "is valid with valid attributes" do
    recipe = FactoryBot.build(:recipe) # Assuming you have a Recipe factory set up
    expect(recipe).to be_valid
  end

  it "is not valid without a title" do
    recipe = FactoryBot.build(:recipe, title: nil)
    expect(recipe).not_to be_valid
  end

  # Add more test cases as needed
end