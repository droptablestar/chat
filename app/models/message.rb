class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, length: { minimum: 2 } 

end
