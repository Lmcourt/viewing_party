FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'secretpasswordshhhh' }
    password_confirmation { 'secretpasswordshhhh' }
    avatar { 'https://randomfox.ca/images/5.jpg' }
  end
end
