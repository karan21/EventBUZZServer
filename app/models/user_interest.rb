class UserInterest < ApplicationRecord
  # self.primary_key = :user, :interest
  belongs_to :user
  belongs_to :interest
end
