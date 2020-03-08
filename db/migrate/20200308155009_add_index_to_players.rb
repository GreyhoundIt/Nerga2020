class AddIndexToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_index :players, %i[first_name surname home_club], unique: true
  end
end
