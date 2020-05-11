class CreateGroupTeam < ActiveRecord::Migration[6.0]
  def change
    create_table :group_teams do |t|
      t.references :group, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
    end
  end
end
