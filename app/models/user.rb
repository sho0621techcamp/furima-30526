class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,          presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
  validates :last_name_kanji,   presence: true
  validates :first_name_kanji,  presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/} do
  validates :last_name_kana,    presence: true
  validates :first_name_kana,   presence: true
  end

  validates :birthday,          presence: true
  
  has_many :items
  has_many :orders
       
end
