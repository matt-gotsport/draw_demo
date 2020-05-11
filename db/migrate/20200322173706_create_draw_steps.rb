class CreateDrawSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :draw_steps do |t|
      t.references :draw_definition, null: false, foreign_key: true
      t.references :draw_step_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
