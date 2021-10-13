FactoryBot.define do
  factory :cast_poro do
    character { Faker::Movies::StarWars.character }
    name { Faker::Name.name }

    initialize_with { new(attributes) }
  end
end
