class TeamSheet < ApplicationRecord
  belongs_to :club
  belongs_to :fixture

  def user_has_current_team_sheet?(fixture_id, club_id)
    TeamSheet.where(fixture_id: fixture_id).where(club_id: club_id).count > 1
  end

end
