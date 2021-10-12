require 'rails_helper'

RSpec.describe 'Discover Index Page' do
  let!(:user) { create :user }

  before :each do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    visit discover_path
  end

  describe 'discover top 40' do
    it 'has a button to discover top 40 movies' do
      click_on 'Discover Top 40 Movies'

      expect(current_path).to eq(movies_path)
    end
  end

  describe 'movie searching' do
    it 'has a search by keywords field' do
      fill_in 'title', with: 'Hello'
      click_on 'Search'

      expect(current_path).to eq(movies_path)
    end
  end
end
