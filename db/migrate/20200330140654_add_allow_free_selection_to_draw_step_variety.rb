class AddAllowFreeSelectionToDrawStepVariety < ActiveRecord::Migration[6.0]
  def change
    add_column :draw_step_varieties, :allow_free_selection, :boolean, default: false
  end
end
