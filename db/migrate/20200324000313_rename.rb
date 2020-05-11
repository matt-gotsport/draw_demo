class Rename < ActiveRecord::Migration[6.0]
  def change
    rename_table :draw_rule_types, :draw_rule_varieties
    rename_table :draw_step_types, :draw_step_varieties
  end
end
