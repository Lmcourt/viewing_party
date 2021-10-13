FactoryBot.define do
  factory :cast_poro do
    character { Faker::Movie::StarWars.character }
    name { Faker::Name.name }

    initialize_with { new(attributes) }
  end
end
