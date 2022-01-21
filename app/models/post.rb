class Post < ApplicationRecord
  has_rich_text :content
  validates :title, :content, presence: true
end
