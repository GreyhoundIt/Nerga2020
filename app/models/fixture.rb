class Fixture < ApplicationRecord

  require 'csv'
  belongs_to :zone


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      zone = Zone.find_by(name: row['ZONE NAME'])
      Fixture.upsert(
          {
                      zone_id: zone.present? ? zone.id : nil,
                      zone_name: row['ZONE NAME'],
                      start_time: row['START TIME'],
                      home_club: row['HOME CLUB'],
                      bye_teams: row['BYE TEAMS'],
                        }, unique_by: %i[ zone_name home_club ])
    end
  end
end
