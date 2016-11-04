class Post < ApplicationRecord
  validates :author, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
end
