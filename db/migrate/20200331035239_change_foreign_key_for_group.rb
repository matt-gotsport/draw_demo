class ChangeForeignKeyForGroup < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:groups, :draw_definition_id, true) 
  end
end
