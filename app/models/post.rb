class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :pic
  validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_many :comments, dependent: :destroy
end
