class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content
  validates :title, :content, presence: true

  belongs_to :user
end
