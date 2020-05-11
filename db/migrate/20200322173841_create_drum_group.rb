class CreateDrumGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :drum_groups do |t|
      t.references :draw, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
    end
  end
end
