class AddAllowSelectionsToDrawStepVariety < ActiveRecord::Migration[6.0]
  def change
    add_column :draw_step_varieties, :allow_team_selection, :boolean
    add_column :draw_step_varieties, :allow_group_selection, :boolean
  end
end
