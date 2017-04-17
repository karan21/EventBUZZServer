class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :user_events
  has_many :events, through: :user_events
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
