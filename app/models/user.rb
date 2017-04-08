class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_interests
  has_many :interests, through: :user_interests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
