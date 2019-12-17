class CreateZones < ActiveRecord::Migration[6.0]
  def change
    create_table :zones do |t|
      t.string :name, :unique => true
      t.string :league
      t.string :rep
      t.string :rep_club
      t.string :team_overall_url
      t.string :person_overall_url

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
    add_index :zones, :name, unique: true
  end
end
