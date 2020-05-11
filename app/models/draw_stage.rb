class DrawStage < ApplicationRecord
  belongs_to :draw_stage_definition
  belongs_to :draw_step
  belongs_to :group

  alias :current_step :draw_step
  alias :input_group :group
  def input_teams() return group.teams end

  def set_current_step(step)
    self.draw_step = step
  end

end
