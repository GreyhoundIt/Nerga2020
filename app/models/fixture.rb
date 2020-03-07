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

  def upload_skeleton_start_sheet(file)
    file_path = "skeleton_start_sheets/#{get_filename}"
    link = "https://nerga.s3.eu-west-2.amazonaws.com/#{file_path}"
    S3FileUploader.new.put_file(file_path: file_path, file: file)
    update(start_sheet_skeleton: link)
  end

  def upload_start_sheet(file)
    file_path = "start_sheets/#{get_filename}"
    link = "https://nerga.s3.eu-west-2.amazonaws.com/#{file_path}"
    S3FileUploader.new.put_file(file_path: file_path, file: file)
    update(start_sheet_official: link)
  end

  def upload_team_overall(file)
    file_path = "fixture_team_overall/#{get_filename}"
    link = "https://nerga.s3.eu-west-2.amazonaws.com/#{file_path}"
    S3FileUploader.new.put_file(file_path: file_path, file: file)
    update(team_overall: link)
  end

  def upload_person_overall(file)
    file_path = "fixture_person_overall/#{get_filename}"
    link = "https://nerga.s3.eu-west-2.amazonaws.com/#{file_path}"
    S3FileUploader.new.put_file(file_path: file_path, file: file)
    update(person_overall: link)
  end

  def get_fixture_teamsheet
    CSV.generate do |csv|
      csv << ["Club"] + team_sheets.attribute_names
      team_sheets.each do |team_sheet|
        club = Club.find(team_sheet.club_id).name
        csv << [club] + team_sheet.attributes.values
      end
    end
  end

  private

  def get_filename
    "#{zone_name.gsub(' ', '_')}_#{home_club.gsub(' ', '_')}.pdf"
  end

end
