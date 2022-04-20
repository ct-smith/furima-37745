class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name,
              presence: { message: "can't be blank" }
    validates :first_name_kanji,
              presence: { message: "can't be blank" },
              format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters', allow_blank: true }
    validates :last_name_kanji,
              presence: { message: "can't be blank" },
              format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters', allow_blank: true }
    validates :first_name_kana,
              presence: { message: "can't be blank" },
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters', allow_blank: true }
    validates :last_name_kana,
              presence: { message: "can't be blank" },
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters', allow_blank: true }
    validates :birth_date,
              presence: { message: "can't be blank" }
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'is invalid. Include both letters and numbers',
                        allow_blank: true }
  end
end
