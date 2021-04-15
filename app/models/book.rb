class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true #空でないように
  validates :body, presence: true, length: { maximum: 200 } # 「200文字以下」

end
