class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  has_one_attached :profile_image
  has_many :dreams, dependent: :destroy  # ユーザーが削除されたらdreamsの投稿も削除する
  has_many :likes, dependent: :destroy  # 投稿が削除された時にいいねも削除する

  def already_favorited?(dream)  # いいねができる記事が存在するのか？
    self.likes.exists?(dream_id: dream.id)  # selfにはcurrent_userが入る。tureの場合いいねを外す。Falseの場合いいねをする。
  end
end
