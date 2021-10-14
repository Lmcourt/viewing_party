FactoryBot.define do
  factory :invitation do
    association :user
    association :party
    role { 0 }
  end
end
