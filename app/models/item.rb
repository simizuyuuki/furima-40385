class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :prefectur
  belongs_to :number
  belongs_to :charge

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefectur_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :number_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates_format_of :price, with: /\A[0-9]+\z/, message: 'は半角数字のみです'

  belongs_to :user
end
