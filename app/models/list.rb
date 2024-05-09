class List < ApplicationRecord
  # リストモデルにimageカラムが追加したかのように扱うことができるようになる
  has_one_attached :image

  # 空欄では投稿できないようにバリデーションを設定する
  validates :title, presence: true
  validates :body, presence: true
  
  # rails cの時は簡易化のためにimageへの制限をコメントアウトする
  validates :image, presence: true

end
