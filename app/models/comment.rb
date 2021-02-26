class Comment < ApplicationRecord
  belongs_to :dream  # tweetsテーブルとのアソシエーション
  belongs_to :user   # usersテーブルとのアソシエーション

  validates :text, presence: true
end
