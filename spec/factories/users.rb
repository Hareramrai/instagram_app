FactoryBot.define do
  factory :user do |u|
    u.email { Faker::Internet.unique.email }
    u.username { Faker::Internet.unique.user_name }
    u.password "Passw0rd"
    u.password_confirmation  "Passw0rd"
    u.profile_picture "default_profile_pic.jpg"
    u.provider "instagram"
  end
end
