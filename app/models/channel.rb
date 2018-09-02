class Channel < ApplicationRecord
  belongs_to :admin, class_name: 'User'

  has_many :messages

  # many-to-many with user
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
