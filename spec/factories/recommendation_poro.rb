FactoryBot.define do
  factory :recommendation_poro do
    id { Faker::Number.within(range: 1..10) }
    title { Faker::Movie.title }

    initialize_with { new(attributes) }
  end
end
