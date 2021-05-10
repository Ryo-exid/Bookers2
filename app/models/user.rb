class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  validates :name, uniqueness: true, length: { in: 2..20 }  #「一意性をもたせる」 #「1文字以上20文字以下」
  validates :introduction, length: { maximum: 50 } # 「50文字以下」


end
