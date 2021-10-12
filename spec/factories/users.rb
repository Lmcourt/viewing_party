FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'secretpasswordshhhh' }
  end
end
