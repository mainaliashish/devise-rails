class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enum role: { user: 0, admin: 1 }

  has_many :posts, -> { order(created_at: :desc) }, dependent: :destroy
  has_one_attached :profile_photo, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
