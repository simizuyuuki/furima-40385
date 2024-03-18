class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :prefectur
  belongs_to :number
  belongs_to :charge

  has_one_attached :image

  validates :name, :description, :image, presence: true
  validates :category_id, :situation_id, :charge_id, :prefectur_id, :number_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
end
