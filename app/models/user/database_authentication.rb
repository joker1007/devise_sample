class User::DatabaseAuthentication < ApplicationRecord
  belongs_to :user
  devise :database_authenticatable, :validatable
end
