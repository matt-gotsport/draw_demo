class CreateDrawDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :draw_definitions do |t|
      t.string :name

      t.timestamps
    end
  end
end
