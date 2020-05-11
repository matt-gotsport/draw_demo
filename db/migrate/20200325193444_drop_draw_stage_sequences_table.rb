class DropDrawStageSequencesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :draw_stage_sequences
  end
end
