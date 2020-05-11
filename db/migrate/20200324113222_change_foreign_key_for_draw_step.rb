class ChangeForeignKeyForDrawStep < ActiveRecord::Migration[6.0]
  def change
    rename_column :draw_steps, :draw_step_type_id, :draw_step_variety_id
  end
end
