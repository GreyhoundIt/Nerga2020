class ChangeTeamsheetsToTeamSheets < ActiveRecord::Migration[6.0]
  def change
    rename_table :teamsheets, :team_sheets
  end
end
