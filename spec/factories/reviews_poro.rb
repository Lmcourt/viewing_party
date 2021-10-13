FactoryBot.define do
  factory :reviews_poro do
    author { Faker::Name.name }
    content { Faker::Lorem.sentence}

    initialize_with { new(attributes) }
  end
end
