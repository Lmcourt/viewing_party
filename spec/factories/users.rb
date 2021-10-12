FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'secretpasswordshhhh' }
    password_confirmation { 'secretpasswordshhhh' }
  end
end
