class CreateDrawOutputGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :draw_output_groups do |t|
      t.references :draw, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.integer :size
    end
  end
end
