class RemoveFirstnameFromTeamsheets < ActiveRecord::Migration[6.0]
  def change
    rename_column :team_sheets, :player_1_first_name, :player_1
    rename_column :team_sheets, :player_2_first_name, :player_2
    rename_column :team_sheets, :player_3_first_name, :player_3
    rename_column :team_sheets, :player_4_first_name, :player_4
    rename_column :team_sheets, :player_5_first_name, :player_5
    rename_column :team_sheets, :player_6_first_name, :player_6
    rename_column :team_sheets, :player_7_first_name, :player_7
    rename_column :team_sheets, :player_8_first_name, :player_8
    rename_column :team_sheets, :guest_1_first_name, :guest_1
    rename_column :team_sheets, :guest_2_first_name, :guest_2
    rename_column :team_sheets, :guest_3_first_name, :guest_3
  end
end
