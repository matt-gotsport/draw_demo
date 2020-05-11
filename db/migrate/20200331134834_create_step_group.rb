class CreateStepGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :step_groups do |t|
      t.references :draw_step, null: false, foreign_key: true
      t.references :draw_output_group_definition, null: false, foreign_key: true
    end
  end
end
