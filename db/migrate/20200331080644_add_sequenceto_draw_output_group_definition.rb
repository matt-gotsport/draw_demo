class AddSequencetoDrawOutputGroupDefinition < ActiveRecord::Migration[6.0]
  def change
    add_column :draw_output_group_definitions, :sequence, :integer
  end
end
