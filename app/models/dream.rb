class Dream < ApplicationRecord
  belongs_to :user
  has_one_attached :image  # Active_storageのアソシエーション

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
