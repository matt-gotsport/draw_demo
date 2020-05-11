class CreateDrawStages < ActiveRecord::Migration[6.0]
  def change
    create_table :draw_stages do |t|
      t.references :draw_stage_definition, null: false, foreign_key: true
      t.references :draw_step, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
