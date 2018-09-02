class Channel < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'

  has_many :messages, dependent: :destroy

  # TODO: subscriptions to channels
  # many-to-many with user
  # has_many :memberships, dependent: :destroy
  # has_many :users, through: :memberships

  validates :name, uniqueness: true, length: {in: 2..20}

end
