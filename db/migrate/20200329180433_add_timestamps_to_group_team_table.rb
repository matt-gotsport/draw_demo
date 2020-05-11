class AddTimestampsToGroupTeamTable < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :group_teams, default: DateTime.now
    change_column_default :group_teams, :created_at, from: DateTime.now, to: nil
    change_column_default :group_teams, :updated_at, from: DateTime.now, to: nil
  end
end
