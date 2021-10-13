require 'rails_helper'

RSpec.describe MoviesPoro do
  let(:movie) { MoviesPoro.new({ id: 1, title: 'Movie', vote_average: 1 }) }

  it 'exists' do
    expect(movie).to be_a(MoviesPoro)
  end

  it 'has attributes' do
    expect(movie.title).to eq('Movie')
    expect(movie.vote_average).to eq(1)
    expect(movie.id).to eq(1)
  end
end
