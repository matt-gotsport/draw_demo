class AddDrawOutputGroupDefinitionToDrawOutputGroup < ActiveRecord::Migration[6.0]
  def change
    add_reference :draw_output_groups, :draw_output_group_definition, null: false, foreign_key: true
  end
end
