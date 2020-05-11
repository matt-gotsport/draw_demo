class CreateDrawStepTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :draw_step_types do |t|
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
