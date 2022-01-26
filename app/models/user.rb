class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2 github]

  enum role: { user: 0, admin: 1 }

  has_many :posts, -> { order(created_at: :desc) }, dependent: :destroy
  has_one_attached :profile_photo, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    User.save_user_info(user, access_token)
  end

  def self.save_user_info(user, access_token)
    email = access_token.info.email
    password = 'password'
    user ||= User.create(email: email, password: password)
    user.first_name = access_token.info.first_name
    user.last_name = access_token.info.last_name
    user.uid = access_token.uid
    user.provider = access_token.provider
    user.save
    user
  end
end
