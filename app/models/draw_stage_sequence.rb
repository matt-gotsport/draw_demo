class DrawStageSequence < ApplicationRecord
  belongs_to :draw_definition
  belongs_to :draw_stage_definition
end
