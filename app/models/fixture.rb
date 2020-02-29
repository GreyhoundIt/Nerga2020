class Fixture < ApplicationRecord

  require 'csv'
  belongs_to :zone
  has_many :team_sheets
  scope :fornight, -> { where 'start_time BETWEEN ? AND ?', Date.today, Date.today + 14.days }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      zone = Zone.find_by(name: row['ZONE NAME'])
      Fixture.upsert(
        {
          zone_id: zone.present? ? zone.id : nil,
          zone_name: row['ZONE NAME'],
          start_time: row['START TIME'],
          home_club: row['HOME CLUB'],
          bye_teams: row['BYE TEAMS']
        }, unique_by: %i[zone_name home_club]
      )
    end
  end

  def get_fixture_teamsheet
    csv_string = CSV.generate do |csv|
      csv << ["Club"] + team_sheets.attribute_names
      team_sheets.each do |team_sheet|
        club = Club.find(team_sheet.club_id).name
        csv << [club] + team_sheet.attributes.values
      end
    end
  end

end
