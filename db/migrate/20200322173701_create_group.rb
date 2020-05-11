class CreateGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :draw_definition, null: false, foreign_key: true
      t.string :name
      t.string :image_file
    end
  end
end
