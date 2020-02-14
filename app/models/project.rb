class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    contestants.length #can you use self for an instance method?
  end

  def average_cont_exp
    contestants.average(:years_of_experience).to_i
  end
end
