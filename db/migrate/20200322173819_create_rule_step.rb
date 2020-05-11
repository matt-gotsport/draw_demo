class CreateRuleStep < ActiveRecord::Migration[6.0]
  def change
    create_table :rule_steps do |t|
      t.references :draw_rule, null: false, foreign_key: true
      t.references :draw_step, null: false, foreign_key: true
    end
  end
end
