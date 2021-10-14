require 'rails_helper'

RSpec.describe CastPoro do
  let(:cast) { build_list :cast_poro, 2 }
  let(:reviews) { build_list :review_poro, 2 }
  let(:genres) { [{ name: 'happy' }, { name: 'thriller' }, { name: 'romance' }] }
  let(:data) do
    {
      title: 'Movie',
      runtime: 124,
      genres: genres,
      overview: 'This is a weird film',
      cast: cast,
      reviews: reviews,
      vote_average: 2
    }
  end
  let(:movie) { SpecificMoviePoro.new(data) }

  it 'has attributes' do
    expect(movie.title).to eq('Movie')
    expect(movie.runtime).to eq(124)
    expect(movie.genres).to eq(%w[happy thriller romance])
    expect(movie.overview).to eq('This is a weird film')
    expect(movie.cast).to eq(cast)
    expect(movie.reviews).to eq(reviews)
    expect(movie.vote_average).to eq(2)
  end

  it 'has a formatted runtime' do
    expect(movie.formatted_runtime).to eq('2 hours 4 minutes')
  end
end
