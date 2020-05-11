class Draw < ApplicationRecord
  belongs_to :draw_definition
  belongs_to :draw_stage
  belongs_to :team, optional: true
  has_many :draw_output_groups, dependent: :destroy
  has_many :groups, through: :draw_output_groups
  has_many :group_teams, through: :groups
  has_many :drum_teams, dependent: :destroy
  has_many :teams, through: :drum_teams
  has_many :drum_groups, dependent: :destroy

  alias :selected_team :team
  alias :current_stage :draw_stage
  alias :team_drum :teams

  def group_drum
    return drum_groups.map{|g| g.group} 
  end

  def set_selected_team(team)
    self.team = team
  end

  def selected_team_id 
    return selected_team ? selected_team.id : nil
  end

  def set_current_stage(draw_stage)
    self.draw_stage = draw_stage
  end

  def get_input_team_ids()
    return draw_definition.get_input_team_ids()
  end

  def get_assigned_team_ids()
    return draw_output_groups.map{|dog| dog.get_team_ids()}.flatten 
  end

end
