class StepGroup < ApplicationRecord
  belongs_to :draw_step
  belongs_to :draw_output_group_definition
end
