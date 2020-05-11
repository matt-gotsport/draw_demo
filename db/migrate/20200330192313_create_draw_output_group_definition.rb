class CreateDrawOutputGroupDefinition < ActiveRecord::Migration[6.0]
  def change
    create_table :draw_output_group_definitions do |t|
      t.references :draw_definition, null: false, foreign_key: true
      t.string :name
      t.integer :size
    end
  end
end
