class RemoveDrawDefinitionFromDrawStep < ActiveRecord::Migration[6.0]
  def change

    remove_column :draw_steps, :draw_definition_id, :integer
  end
end
