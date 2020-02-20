class User::PlayersController < ::User::BaseController

  def add
    first_name = player_params['player'].first.capitalize
    surname = player_params['player'].second.capitalize
    players_club = current_user.club
    Player.create(first_name: first_name, surname: surname, home_club: players_club.name, exact_handicap: "n/a", pin: Time.now.to_i, club_id: players_club.id)
  end

  private

  def player_params
    params.permit(player: [])
  end

  def hello
    
  end


end
