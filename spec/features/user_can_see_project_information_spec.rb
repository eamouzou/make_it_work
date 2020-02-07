require 'rails_helper'

RSpec.describe "project information", type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @newsproject = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardproject = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @couchproject = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lampproject = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end

  scenario "visit project show page, see name, material and theme" do
    visit "/projects/:id"

    within("#project-#{@lampproject.id}") do
      theme = Challenge.find(@lampproject.challenge_id)

      expect(page).to have_content("#{@lampproject.name}")
      expect(page).to have_content("#{@lampproject.material}")
      expect(page).to have_content(theme)
    end
  end
end
