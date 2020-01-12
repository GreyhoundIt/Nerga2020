class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :username, presence: true

  devise :database_authenticatable, :rememberable, :validatable, :authentication_keys => [:username]

  def club
    Club.find(club_id)
  end
end
