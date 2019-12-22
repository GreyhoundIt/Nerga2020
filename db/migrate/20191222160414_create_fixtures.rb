class CreateFixtures < ActiveRecord::Migration[6.0]
  def change
    create_table :fixtures do |t|
      t.integer :zone_id
      t.string :zone_name
      t.datetime :start_time
      t.string :home_club
      t.string :bye_teams
      t.string :start_sheet_skeleton
      t.string :start_sheet_official
      t.string :team_overall
      t.string :person_overall

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }

      t.index :zone_id
      t.index [:zone_name, :home_club], unique: true
    end
  end
end
