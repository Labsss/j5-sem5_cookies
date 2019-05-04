class PrivateMessage < ApplicationRecord
    belongs_to :sender, class_name: "User", required: false
    belongs_to :recipient, class_name: "User", required: false
end
