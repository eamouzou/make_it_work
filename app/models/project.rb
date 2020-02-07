class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def theme
    (Challenge.find(challenge_id)).theme
  end

  def create_contestants(name, age, hometown, years_of_experience)
    self.contestants.create(name: name, age: age, hometown: hometown, years_of_experience: years_of_experience)
  end

end
