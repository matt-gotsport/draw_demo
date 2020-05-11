class AddOutputGroupPropertiesToDrawDefinition < ActiveRecord::Migration[6.0]
  def change
    add_column :draw_definitions, :output_group_name, :string
    add_column :draw_definitions, :output_group_count, :integer
    add_column :draw_definitions, :output_group_size, :integer
  end
end
