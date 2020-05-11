class DrawStepSequence < ApplicationRecord
  belongs_to :draw_stage_definition
  belongs_to :draw_step
end
