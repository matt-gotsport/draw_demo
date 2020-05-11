class RenameTypeForDrawStepVariety < ActiveRecord::Migration[6.0]
  def change
    rename_column :draw_step_varieties, :type, :variety  
  end
end
