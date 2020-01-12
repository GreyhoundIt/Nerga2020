module ZonesHelper
  # check if current users club is part of the zones club membership
  def user_can_enter_team?
    @zone.id.in?(current_user.club.zones.map(&:id))
  end
end
