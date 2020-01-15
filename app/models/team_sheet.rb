class TeamSheet < ApplicationRecord
  belongs_to :club
  belongs_to :fixture
end
