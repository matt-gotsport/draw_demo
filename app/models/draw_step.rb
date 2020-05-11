class DrawStep < ApplicationRecord
  belongs_to :draw_stage_definition
  belongs_to :draw_step_variety
  
  has_one :draw_step_sequence, dependent: :destroy
  
  has_many :step_groups
  has_many :draw_output_group_definitions, through: :step_groups
  has_many :rule_steps
  has_many :draw_rules, through: :rule_steps

  def draw_output_group_definition_ids
    return self.draw_output_group_definitions.map{|d| d.id}
  end

  def description
    return self.draw_step_variety.description
  end

end
