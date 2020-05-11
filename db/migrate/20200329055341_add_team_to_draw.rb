class AddTeamToDraw < ActiveRecord::Migration[6.0]
  def change
    add_reference :draws, :team, null: true, foreign_key: true
  end
end
