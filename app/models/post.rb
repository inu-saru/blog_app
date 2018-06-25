class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  #validates :user_id, presence: true
  #validates :content, presence: true, length: { maximum: 140 }
end
