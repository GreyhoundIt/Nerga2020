class Club < ApplicationRecord

  require 'csv'
  has_many :memberships
  has_many :zones, through: :memberships
  has_many :players
  has_many :users

  scope :published, -> { where.not(name: 'Google') }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      upsert({
        name: row['NAME'],
        postcode: row['POSTCODE'],
        website: row['WEBSITE']
        }, unique_by: :name)
    end
  end
end
