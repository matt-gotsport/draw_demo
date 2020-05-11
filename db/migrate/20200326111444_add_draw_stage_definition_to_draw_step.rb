class AddDrawStageDefinitionToDrawStep < ActiveRecord::Migration[6.0]
  def change
    add_column :draw_steps, :draw_Stage_definition_id, :integer
  end
end
