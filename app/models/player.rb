# frozen_string_literal: true

class Player < ApplicationRecord
  require 'csv'

  PLAYER_FILE_PATH = 'public/players.csv'

  def self.upload_players
    CSV.foreach('public/players.csv', headers: true) do |row|
      Player.upsert({
                      surname: row[0],
                      first_name: row['FIRST NAME'],
                      exact_handicap: row['CURRENT PLAYING HANDICAP'].gsub(/c/, ''),
                      club: row['HOME CLUB'],
                      pin: row['PIN']
                    }, unique_by: :pin)
    end
  end
end
