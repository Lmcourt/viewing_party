FactoryBot.define do
  factory :movies_poro do
    title { Faker::Movie.unique.title }
    vote_average { Faker::Number.within(range: 1..10) }
    id { Faker::Number.within(range: 1..10) }

    initialize_with { new(attributes) }
  end
end
