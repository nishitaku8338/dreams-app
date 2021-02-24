class Like < ApplicationRecord
  validates_uniqueness_of :dream_id, scope: :user_id  # 有効なアクセス権を重複して付与しない

  belongs_to :user   # アソシエーション
  belongs_to :dream  # アソシエーション
end
