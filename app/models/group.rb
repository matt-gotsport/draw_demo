class Group < ApplicationRecord
  belongs_to :draw_definition, optional: true
  has_many :group_teams, dependent: :destroy
  has_many :teams, through: :group_teams
  has_many :draw_stages, dependent: :destroy 

  def team_ids
    return self.teams.map{|t| t.id}
  end

  def team_names
    return self.teams.map{|t| t.name}
  end
end
