class Club < ApplicationRecord

  require 'csv'

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
