class RenameDrawStageDefinitionForDrawStep < ActiveRecord::Migration[6.0]
  def change
    rename_column :draw_steps, :draw_Stage_definition_id, :draw_stage_definition_id  
  end
end
