class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_hurigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_hurigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, presence: true
  validates :date_of_birth, presence: true

  has_many :items
end
