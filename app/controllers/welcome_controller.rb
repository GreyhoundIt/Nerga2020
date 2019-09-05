class WelcomeController < ApplicationController

  def index
    Player.upload_players
  end

end
