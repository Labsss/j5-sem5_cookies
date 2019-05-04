class Gossip < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :tag_gossip, required: false
  has_many :tags, through: :tag_gossips
  has_many :comments

  validates :title, presence: true, length: { minimum: 3, message: "title need 3 car. "} 
  validates :content,presence: true
end
