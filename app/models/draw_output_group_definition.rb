class DrawOutputGroupDefinition < ApplicationRecord
  belongs_to :draw_definition
  has_many :step_groups, dependent: :destroy
end
