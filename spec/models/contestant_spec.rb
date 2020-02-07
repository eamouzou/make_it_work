require 'rails_helper'


RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "methods" do
    describe "instance method" do
      before(:each) do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        @newsproject = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        @boardproject = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        @couchproject = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
        @lampproject = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

        @contestant1 = @newsproject.contestants.create(name: "bill", age: 5, hometown: "Hoboken", years_of_experience: 8)
        @contestant7 = @lampproject.contestants.create(name: "aminata", age: 50, hometown: "Tambacounda", years_of_experience: 37)
      end

      it "can find and produce a string of project names it is connected to" do
        expect(@contestant1.project_names).to eq("News Chic")
        expect(@contestant7.project_names).to eq("Litfit")
      end
    end
  end
end
