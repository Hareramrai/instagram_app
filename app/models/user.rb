class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: %i[instagram]

  class << self
    def from_omniauth(auth)
      info = auth.extra.raw_info
      user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
      user.email = info.username + "@myemail.com"
      user.password = Devise.friendly_token[0,20]
      user.name = info.full_name   
      user.profile_picture = info.profile_picture
      user.username = info.username
      user.token = auth.credentials.token
      user.save
      user
    end
  end 

end
