class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :birthday, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :first_name,
            format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'First name Full-width katakana characters' }
  validates :family_name,
            format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Family name Full-width katakana characters' }
  validates :first_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'First name kana Full-width katakana characters' }
  validates :family_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'Family name kana Full-width katakana characters' }

  has_many :items
  has_many :orders
end
