class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :club
  validates :username, presence: true

  devise :database_authenticatable, :rememberable, :validatable, :authentication_keys => [:username]
end
