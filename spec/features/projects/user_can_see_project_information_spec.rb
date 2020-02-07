require 'rails_helper'

RSpec.describe "project information", type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @newsproject = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardproject = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @couchproject = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lampproject = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @contestant1 = @newsproject.create_contestants("bill", 5, "Hoboken", 8)
    @contestant2 =  @newsproject.create_contestants("chronixx", 28, "Kingston", 20)

    @contestant3 = @boardproject.create_contestants("malachi", 18, "Montbello", 2)
    @contestant4 = @boardproject.create_contestants("javohn", 46, "Jackson", 30)

    @contestant5 = @couchproject.create_contestants("uchekwukwu", 23, "Lagos", 10)
    @contestant6 = @couchproject.create_contestants("valentina", 30, "Chiapas", 6)

    @contestant7 =   @newsproject.create_contestants("aminata", 50, "Tambacounda", 37)
    @contestant8 =   @newsproject.create_contestants("lee", 34, "Marseilles", 5)
  end

  scenario "visit project show page, see name, material and theme" do
    visit "/projects/#{@lampproject.id}"

      theme = (Challenge.find(@lampproject.challenge_id)).theme

      expect(page).to have_content("#{@lampproject.name}")
      expect(page).to have_content("#{@lampproject.material}")
      expect(page).to have_content(theme)
  end
end
