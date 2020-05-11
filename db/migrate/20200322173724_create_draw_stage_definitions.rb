class CreateDrawStageDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :draw_stage_definitions do |t|
      t.references :draw_definition, null: false, foreign_key: true
      t.string :name
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
