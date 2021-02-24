class Dream < ApplicationRecord
  belongs_to :user
  has_one_attached :image  # Active_storageのアソシエーション

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
