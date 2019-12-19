# frozen_string_literal: true

class Player < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      club = Club.find_by(name: row['HOME CLUB'])
      Player.upsert({
                      surname: row[0],
                      first_name: row['FIRST NAME'],
                      exact_handicap: row['CURRENT PLAYING HANDICAP'].gsub(/c/, ''),
                      club: row['HOME CLUB'],
                      pin: row['PIN'],
                      club_id: club.present? ? club.id : nil
                    }, unique_by: :pin)
    end
  end

end
