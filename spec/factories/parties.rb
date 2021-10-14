FactoryBot.define do
  factory :party do
    movie_title { "Howl's Moving Castle" }
    duration { 1 }
    date { Date.today }
    start_time { Time.now }
    movie_id { 1 }
  end
end
