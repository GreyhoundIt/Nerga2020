# frozen_string_literal: true
class Player < ApplicationRecord
  require 'csv'

  belongs_to :club

  scope :no_club, -> { where(club_id: nil) }
  scope :ordered, -> { order(home_club: :asc, surname: :asc) }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      club = Club.find_by(name: row['HOME CLUB'])
      Player.upsert({
                      surname: row[0].capitalize,
                      first_name: row['FIRST NAME'].capitalize,
                      exact_handicap: row['CURRENT PLAYING HANDICAP'].gsub(/c/, ''),
                      home_club: row['HOME CLUB'],
                      pin: row['PIN'],
                      club_id: club.present? ? club.id : nil
                    }, unique_by: :pin)
    end
  end

  # Delete all players with no active clubs
  def self.remove_orphaned_players
    no_club.destroy_all
  end
end
