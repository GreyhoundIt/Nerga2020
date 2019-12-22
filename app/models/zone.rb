class Zone < ApplicationRecord

  require 'csv'
  has_many :memberships
  has_many :clubs, :through => :memberships
  has_many :fixtures

  scope :nerga, -> { where(league: 'Nerga') }
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

end
