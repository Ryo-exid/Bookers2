class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

  validates :name, uniqueness: true, length: { in: 2..20 }  #「一意性をもたせる」 #「1文字以上20文字以下」
  validates :introduction, length: { maximum: 50 } # 「50文字以下」

  has_secure_password
end
