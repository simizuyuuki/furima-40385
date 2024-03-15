class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :situation, presence: true
  validates :charge, presence: true
  validates :prefectur, presence: true
  validates :number, presence: true
  validates :price, presence: true

  belongs_to :user

end
