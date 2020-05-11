class DrawStageDefinition < ApplicationRecord
  belongs_to :draw_definition
  belongs_to :group
  has_one :draw_stage_sequence, dependent: :destroy
  has_many :draw_stages, dependent: :destroy
  has_many :draw_step_sequences, dependent: :destroy
  has_many :draw_steps, through: :draw_step_sequences

  alias :input_group :group

  def get_input_team_ids()
    return input_group.team_ids  
  end

end
