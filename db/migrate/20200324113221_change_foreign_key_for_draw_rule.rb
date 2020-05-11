class ChangeForeignKeyForDrawRule < ActiveRecord::Migration[6.0]
  def change
    rename_column :draw_rules, :draw_rule_type_id, :draw_rule_variety_id
  end
end
