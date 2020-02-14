require 'rails_helper'

RSpec.describe "projects show page", type: :feature do
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
    @lampproject.contestants.push(@contestant1, @contestant2, @contestant3)
  end

  scenario "visit project show page, see name, material and theme" do
    visit "/projects/#{@lampproject.id}"


    expect(page).to have_content("#{@lampproject.name}")
    expect(page).to have_content("#{@lampproject.material}")
    expect(page).to have_content(@furniture_challenge.theme)
  end

  scenario "visit project show page, see count of contestants" do
    visit "/projects/#{@lampproject.id}"

    expect(page).to have_content("Number of Contestants: 3")
  end

  scenario "average contestant experience" do
    visit "/projects/#{@lampproject.id}"

    expect(page).to have_content("Average Contestant Experience: 10")
  end

  scenario "add a contestant to a project" do
    visit "/projects/#{@lampproject.id}"
    expect(page).to have_content("Number of Contestants: 3")
    expect(page).to have_content("Fill out this form to add a contestant!")
    fill_in "id", with: @contestant4.id
    click_button 'Add a Contestant'

    expect(current_path).to eq("/projects/#{@lampproject.id}")
    expect(page).to have_content("Number of Contestants: 4")

    visit "/contestants"

    within("#projects-#{@contestant4.id}") do
      expect(page).to have_content(@contestant4.name)
      expect(page).to have_content(@lampproject.name)
    end
  end
end
