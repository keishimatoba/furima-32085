class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX    
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, uniqueness: {case_sensitive: false},
                      format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
        validates :first_name, format: {message: 'First name Full-width katakana characters' }
        validates :family_name, format: {message: 'Family name Full-width katakana characters' }
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
        validates :first_name_kana, format: {message: 'First name kana Full-width katakana characters' }
        validates :family_name_kana, format: {message: 'Family name kana Full-width katakana characters' }
    end
  end


  has_many :items
  has_many :orders
end

