class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages

  has_many :owned_channels, class_name: 'Channel'

  # many-to-many with channel
  # has_many :memberships, dependent: :destroy
  # has_many :channels, through: :memberships, source: :channel

  validates :alias, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+[a-zA-Z0-9]*\z/,
    message: "only allows letters and numbers" }

  # need to do this bc devise always checks email
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
