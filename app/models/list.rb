class List < ApplicationRecord
  # リストモデルにimageカラムが追加したかのように扱うことができるようになる
  has_one_attached :image
end
