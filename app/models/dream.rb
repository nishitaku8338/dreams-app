class Dream < ApplicationRecord
  belongs_to :user
  has_one_attached :image  # Active_storageのアソシエーション
end
