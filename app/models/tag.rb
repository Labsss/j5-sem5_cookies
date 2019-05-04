class Tag < ApplicationRecord
    belongs_to :tag_gossips, required: false
    has_many :gossips, through: :tag_gossips
end
