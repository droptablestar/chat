class User < ApplicationRecord
  has_secure_password

  has_many :messages

  # many-to-many with channel
  has_many :memberships, dependent: :destroy
  has_many :channels, through: :memberships
end
