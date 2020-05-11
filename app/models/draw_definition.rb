class DrawDefinition < ApplicationRecord
  has_many :groups, dependent: :nullify
  has_many :draws, dependent: :destroy 
  has_many :draw_output_group_definitions, dependent: :destroy 
  has_many :draw_stage_definitions, dependent: :destroy 
  has_many :draw_stage_sequences, dependent: :destroy 
  has_many :draw_rules, dependent: :destroy

  def get_input_team_ids()
    return draw_stage_definitions.map{|dsd| dsd.get_input_team_ids()}.flatten  
  end

end
