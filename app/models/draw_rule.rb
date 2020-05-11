class DrawRule < ApplicationRecord
  belongs_to :draw_definition
  belongs_to :draw_rule_variety

  has_many :rule_steps, dependent: :destroy 
  has_many :rule_groups, dependent: :destroy  
  
  has_many :draw_steps, through: :rule_steps
  has_many :groups, through: :rule_groups

  def draw_step_ids
    return self.draw_steps.map{|d| d.id}
  end

  def draw_rule_ids
    return self.groups.map{|d| d.id}
  end

end
