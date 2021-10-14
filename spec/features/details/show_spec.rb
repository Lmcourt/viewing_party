require 'rails_helper'

RSpec.describe 'Details show page' do
  describe 'content' do
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
      visit details_path
    end

    it 'has movie title' do
      expect(page).to have_content(movie.title)
    end

    context 'stats' do
      it 'has movie stats' do
        within("#stats") do
          expect(page).to have_content(movie.formatted_runtime)
          expect(page).to have_content(movie.vote_average)
          movie.genres.each do |genre|
            expect(page).to have_content(genre)
          end
        end
      end
    end

    context 'reviews' do
      it 'has a review author and content' do
        within("#reviews") do
          movie.reviews.each do |review|
            expect(page).to have_content(review.author)
            expect(page).to have_content(review.content)
          end
        end
      end
    end

    context 'cast' do
      it 'has cast' do
        within("#cast") do
          movie.cast.each do |person|
            expect(page).to have_content("#{person.name} as #{person.character}")
          end
        end
      end
    end

    context 'summary' do
      it 'has a summary' do
        within("#summary") do
          expect(page).to have_content(movie.overview)
        end
      end
    end
  end
end
