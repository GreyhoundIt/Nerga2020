class ChangeClubToHomeClub < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :club, :home_club
  end
end
