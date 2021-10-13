require 'rails_helper'

RSpec.describe MovieService, :vcr do
  context 'top' do
    it 'finds top 40 movies' do
      result = MovieService.movies({ top: true })
      expect(result.size).to eq(40)
      expect(result).to be_a(Array)
    end
  end

  context 'search' do
    it 'can search for a movie by title' do
      result = MovieService.movies({ title: 'Gladiator' })
      expect(result.size).to eq(40)
      expect(result).to be_a(Array)
      expect(result.first[:title]).to include('Gladiator')
    end
  end
end
