class Club < ApplicationRecord

  require 'csv'
  has_many :memberships
  has_many :zones, :through => :memberships

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
