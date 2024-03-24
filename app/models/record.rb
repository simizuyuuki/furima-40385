class Record < ApplicationRecord
  attr_accessor :token

  # validates :user_id, presence: true
  # validates :itam_id, presence: true
  belongs_to :user
  belongs_to :item
end
