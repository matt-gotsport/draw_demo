class RenameTypeForDrawRuleVariety < ActiveRecord::Migration[6.0]
  def change
    rename_column :draw_rule_varieties, :type, :variety  
  end
end
