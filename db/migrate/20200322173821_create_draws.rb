class CreateDraws < ActiveRecord::Migration[6.0]
  def change
    create_table :draws do |t|
      t.references :draw_definition, null: false, foreign_key: true
      t.references :draw_stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
