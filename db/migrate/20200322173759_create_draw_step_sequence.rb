class CreateDrawStepSequence < ActiveRecord::Migration[6.0]
  def change
    create_table :draw_step_sequences do |t|
      t.references :draw_stage_definition, null: false, foreign_key: true
      t.references :draw_step, null: false, foreign_key: true
      t.integer :sequence
    end
  end
end
