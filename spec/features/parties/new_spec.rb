require 'rails_helper'

RSpec.describe 'new party page' do
  let(:movie_info) { { id: 12, title: 'Good film', runtime: 123 } }
  let(:user) { create :user }
  let!(:friends) { create_list :user, 3 }
  let(:date) { Date.today + 1 }

  describe 'form' do
    before :each do
      user.friends << friends[1..]
      friends.first.friends << user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_party_path(movie_info: movie_info)
    end

    it 'has a form' do
      expect(page).to have_field('party[movie_title]', with: movie_info[:title], disabled: true)
      expect(page).to have_field('party[duration]', with: movie_info[:runtime])
      page.select date.strftime('%Y'), from: 'party[date(1i)]'
      page.select date.strftime('%b'), from: 'party[date(2i)]'
      page.select date.strftime('%d'), from: 'party[date(3i)]'
      fill_in 'party[start_time]', with: Time.now
      check friends.last.email

      click_on 'Submit'

      expect(current_path).to eq(dashboard_path)
      expect(Party.count).to eq(1)
      expect(Party.first.users).to include(friends.last)
    end
  end
end
