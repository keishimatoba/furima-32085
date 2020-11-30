class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,:email,:birthday, presence: true
         validates :family_name, presence: true
         validates :first_name, presence: true
         validates :family_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :email, uniqueness: true,
                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
        #  validates :encrypted_password, confirmation: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
         validates :first_name,
                   :family_name,
                   :first_name_kana,
                   :family_name_kana,
                   format: {with: /[^ -~｡-ﾟ]+/}

  has_many :items
  has_many :orders


end

                                