class CreateDrumTeam < ActiveRecord::Migration[6.0]
  def change
    create_table :drum_teams do |t|
      t.references :draw, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
    end
  end
end
