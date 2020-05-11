class AddSequenceToGroupTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :group_teams, :sequence, :integer, :null => true
  end
end
