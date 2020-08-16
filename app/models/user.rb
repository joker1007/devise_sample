class User < ApplicationRecord
  devise :authenticatable

  has_one :database_authentication
end
