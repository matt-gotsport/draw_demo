class CreateRuleGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :rule_groups do |t|
      t.references :draw_rule, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
    end
  end
end
