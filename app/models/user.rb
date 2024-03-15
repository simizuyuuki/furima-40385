class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/}
  validates :encrypted_password, presence: true
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name, presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_hurigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :last_hurigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, presence: true
  validates :date_of_birth, presence: true

  has_many :items
end