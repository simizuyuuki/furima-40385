class ShipAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectur

  # validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  # validates :prefectur_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :municipalities, presence: true
  # validates :address, presence: true
  # validates :telephone, presence: true, format: { with: /\A\d{10,11}\z/ }
end
