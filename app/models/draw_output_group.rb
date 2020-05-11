class DrawOutputGroup < ApplicationRecord
  belongs_to :draw_output_group_definition
  belongs_to :group

  def get_team_ids()
    return group.team_ids
  end

end
