class User < ApplicationRecord
  has_secure_password

  has_many :messages

  has_many :owned_channels, class_name: 'Channel'

  # many-to-many with channel
  # has_many :memberships, dependent: :destroy
  # has_many :channels, through: :memberships, source: :channel
end
