FactoryBot.define do
  factory :party do
    movie_title { Faker::Movie.title }
    duration { 1 }
    date { Date.today }
    start_time { Time.now }
    movie_id { 19404 }
  end
end
