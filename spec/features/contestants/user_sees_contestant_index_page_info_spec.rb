require 'rails_helper'

RSpec.describe "contestant information", type: :feature do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @newsproject = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardproject = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @couchproject = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lampproject = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @contestant1 = @newsproject.contestants.create(name: "bill", age: 5, hometown: "Hoboken", years_of_experience: 8)
    @contestant2 =   @newsproject.contestants.create(name: "chronixx", age: 28, hometown: "Kingston", years_of_experience: 20)

    @contestant3 = @boardproject.contestants.create(name: "malachi", age: 18, hometown: "Montbello", years_of_experience: 2)
    @contestant4 = @boardproject.contestants.create(name: "Javohn", age: 46, hometown: "Jackson", years_of_experience: 30)

    @contestant5 = @couchproject.contestants.create(name: "uchekwukwu", age: 23, hometown: "Lagos", years_of_experience: 10)
    @contestant6 = @couchproject.contestants.create(name: "valentina", age: 30, hometown: "Chiapas", years_of_experience: 6)

    @contestant7 =   @newsproject.contestants.create(name: "aminata", age: 50, hometown: "Tambacounda", years_of_experience: 37)
    @contestant8 =   @newsproject.contestants.create(name: "lee", age: 34, hometown: "Marseilles", years_of_experience: 5)
  end

  describe "visit contestant index page, see all names and projects" do
    it "displays all contestant names" do
      visit "/contestants"
      expect(page).to have_content(@contestant1.name)

      within("#contestant-#{@constestant1.id}") do
         expect(page).to have_link(@contestant1.projects)
       end

      expect(page).to have_content(@contestant2.name)

      within("#contestant-#{@constestant2.id}") do
         expect(page).to have_link(@contestant2.projects)
       end

       #might need an add_contestant method for projects
    end
  end


end
