require 'rails_helper'

RSpec.describe 'Movies index page' do
  let!(:user) { create :user }
  let(:fake_movies) { build_list :movies_poro, 5 }

  before :each do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    allow(MovieFacade)
      .to receive(:movies).and_return(fake_movies)

    visit movies_path
  end

  describe 'has search button and form' do
    it 'has a button to discover top 40 movies' do
      click_on 'Discover Top 40 Movies'

      expect(current_path).to eq(movies_path)
    end

    it 'has a search by keywords field' do
      fill_in 'title', with: 'Hello'
      click_on 'Search'

      expect(current_path).to eq(movies_path)
    end
  end

  describe 'api results' do
    let(:cast) { build_list :cast_poro, 2 }
    let(:reviews) { build_list :review_poro, 2 }
    let(:genres) { [{ name: 'happy' }, { name: 'thriller' }, { name: 'romance' }] }
    let(:data) do
      {
        title: 'Movie',
        runtime: 124,
        genres: genres,
        summary: 'This is a weird film',
        cast: cast,
        reviews: reviews,
        vote_average: 2
      }
    end
    let(:movie) { SpecificMoviePoro.new(data) }

    before :each do
      allow(MovieFacade).to receive(:movie_details).and_return(movie)
    end
    
    it 'has title as link to movie details' do
      click_on fake_movies.first.title

      expect(current_path).to eq(details_path)
      # expect(page).to have_content(fake_movies.first.title)
    end

    it 'has vote average of the movie' do
      expect(page).to have_content(fake_movies.first.vote_average)
    end
  end
end
