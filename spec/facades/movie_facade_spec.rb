require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  describe 'multiple movies' do
    it 'returns an array of movie objects' do
      result = MovieFacade.movies({ top: true })
      expect(result.size).to eq(40)
      expect(result).to be_a(Array)
      expect(result.first).to be_a(MoviesPoro)
    end
  end

  describe 'specific movie' do
    it 'returns a specific movie object' do
      result = MovieFacade.movie_details(19404)
      expect(result).to be_a(SpecificMoviePoro)
      expect(result.cast.first).to be_a(CastPoro)
      expect(result.reviews.first).to be_a(ReviewPoro)
    end
  end
end
