class RemoveSurnamesFromTeamsheets < ActiveRecord::Migration[6.0]
  def change
    remove_column :team_sheets, :player_1_surname
    remove_column :team_sheets, :player_2_surname
    remove_column :team_sheets, :player_3_surname
    remove_column :team_sheets, :player_4_surname
    remove_column :team_sheets, :player_5_surname
    remove_column :team_sheets, :player_6_surname
    remove_column :team_sheets, :player_7_surname
    remove_column :team_sheets, :player_8_surname
    remove_column :team_sheets, :guest_1_surname
    remove_column :team_sheets, :guest_2_surname
    remove_column :team_sheets, :guest_3_surname
  end
end
