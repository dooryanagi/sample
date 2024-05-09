class List < ApplicationRecord
  # リストモデルにimageカラムが追加したかのように扱うことができるようになる
  has_one_attached :image

  # 空欄では投稿できないようにバリデーションを設定する
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

end
