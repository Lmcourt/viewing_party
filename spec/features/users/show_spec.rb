require 'rails_helper'

RSpec.describe 'User show' do
  describe 'requires a user' do
    it 'redirects if no user' do
      visit dashboard_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Please login or create an account.')
    end
  end

  describe 'user dashboard page' do
    let!(:user) { create :user }

    before :each do
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

      visit dashboard_path
    end

    describe 'discover movies section' do
      it 'has a button to discover top 40 movies' do
        within '#discover-button' do
          click_on 'Discover Movies'
        end

        expect(current_path).to eq(discover_path)
      end
    end
  end
end
