require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
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
      end

      it "can find the theme it is connected to" do
        expect(@lampproject.theme).to eq("Apartment Furnishings")
      end

      it "can create contestants" do
        expect((@newsproject.create_contestants("bill", 5, "Hoboken", 8)).name).to eq("bill")
      end
    end
  end
end
