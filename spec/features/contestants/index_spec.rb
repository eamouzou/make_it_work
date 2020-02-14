require 'rails_helper'

RSpec.describe "contestant index page", type: :feature do
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
    @contestant4 = @boardproject.contestants.create(name: "javohn", age: 46, hometown: "Jackson", years_of_experience: 30)

    @contestant5 = @couchproject.contestants.create(name: "uchekwukwu", age: 23, hometown: "Lagos", years_of_experience: 10)
    @contestant6 = @couchproject.contestants.create(name: "valentina", age: 30, hometown: "Chiapas", years_of_experience: 6)

    @contestant7 =   @newsproject.contestants.create(name: "aminata", age: 50, hometown: "Tambacounda", years_of_experience: 37)
    @contestant8 =   @newsproject.contestants.create(name: "lee", age: 34, hometown: "Marseilles", years_of_experience: 5)

    @contestant1.projects.push(@couchproject, @boardproject)
    @contestant3.projects.push(@newsproject, @couchproject)
end

  it "I visit the contestants index page and see a list of names" do
    visit "/contestants"

    within("#projects-#{@contestant1.id}") do
      expect(page).to have_content(@contestant1.name)
      expect(page).to have_content("#{@contestant1.projects[0].name} #{@contestant1.projects[1].name} #{@contestant1.projects[2].name}")
    end

    within("#projects-#{@contestant3.id}") do
      expect(page).to have_content(@contestant3.name)
      expect(page).to have_content("#{@contestant3.projects[0].name} #{@contestant3.projects[1].name} #{@contestant3.projects[2].name}")
    end
  end

end
