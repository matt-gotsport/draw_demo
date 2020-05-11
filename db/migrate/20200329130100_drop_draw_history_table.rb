class DropDrawHistoryTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :draw_histories
  end
end
