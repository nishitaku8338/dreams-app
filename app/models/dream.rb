class Dream < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end

  belongs_to :user
  has_one_attached :image  # Active_storageのアソシエーション
  has_many :likes, dependent: :destroy  # 投稿が削除された時にいいねも削除する
end
