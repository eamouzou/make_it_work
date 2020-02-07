class Contestant <ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :hometown
  validates_presence_of :years_of_experience

  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def project_names
    projects = self.projects.map {|project| project.name}
    projects.reduce("") do |acc, project|
      acc += project
      acc
    end
  end
end
