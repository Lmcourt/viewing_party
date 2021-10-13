FactoryBot.define do
  factory :review_poro do
    author { Faker::Name.name }
    content { Faker::Lorem.sentence}

    initialize_with { new(attributes) }
  end
end
