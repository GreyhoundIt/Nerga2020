module ZonesHelper

  # check if current users club is part of the zones club membership
  def user_can_enter_team?
    @zone.id.in?(current_user.club.zones.map(&:id))
  end

  def user_has_current_team_sheet?(fixture_id)
    TeamSheet.where(fixture_id: fixture_id).where(club_id: current_user.club.id).count > 1
  end

end
