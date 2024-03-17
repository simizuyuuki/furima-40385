class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefectur_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :number_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true

  belongs_to :user

end
