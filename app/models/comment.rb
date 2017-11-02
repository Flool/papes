class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_attached_file :pic
  validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
