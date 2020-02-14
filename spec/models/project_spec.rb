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

  before(:each) do
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @lampproject = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    @contestant1 = @lampproject.contestants.create(name: "bill", age: 5, hometown: "Hoboken", years_of_experience: 8)
    @contestant2 =   @lampproject.contestants.create(name: "chronixx", age: 28, hometown: "Kingston", years_of_experience: 20)
    @contestant3 = @lampproject.contestants.create(name: "malachi", age: 18, hometown: "Montbello", years_of_experience: 2)
  end

  it ".contestant_count"  do  # use period (.) for instance methods and hashtag (#) for class methods
    expect(@lampproject.contestant_count).to eq(3)
  end

  it ".average_cont_exp" do
    expect(@lampproject.average_cont_exp).to eq(10)
  end
end
