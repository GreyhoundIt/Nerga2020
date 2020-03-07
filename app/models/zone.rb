class Zone < ApplicationRecord

  require 'csv'
  has_many :memberships
  has_many :clubs, :through => :memberships
  has_many :fixtures

  scope :rabbits, -> { where(league: 'Rabbits') }
  scope :inter, -> { where(league: 'Inter') }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Zone.upsert({
                  name: row['NAME'],
                  league: row['LEAGUE'],
                  rep: row['REP'],
                  rep_club: row['REPCLUB'],
                  team_overall_url: row['TEAM'],
                  person_overall_url: row['PERSON']
                  }, unique_by: :name)
    end
  end

  def upload_team_overall(file)
    return false unless pdf_file(file)

    file_path = "zone_team_overall/#{build_file_path}"
    link = "https://nerga.s3.eu-west-2.amazonaws.com/#{file_path}"
    S3FileUploader.new.put_file(file_path: file_path, file: file)
    update(team_overall_url: link)
  end

  def upload_person_overall(file)
    return false unless pdf_file(file)

    file_path = "zone_person_overall/#{build_file_path}"
    link = "https://nerga.s3.eu-west-2.amazonaws.com/#{file_path}"
    S3FileUploader.new.put_file(file_path: file_path, file: file)
    update(person_overall_url: link)
  end

  def menu_name
    name.gsub(/(inter\s?)|(rabbits\s?)/i, '')
  end

  private

  def sanitized_zone_name
    name.gsub(' ', '_')
  end

  def build_file_path
    "#{sanitized_zone_name}.pdf"
  end

  def pdf_file(file)
    file.content_type == 'application/pdf'
  end

end
