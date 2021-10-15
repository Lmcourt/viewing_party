require 'rails_helper'

RSpec.describe 'User show', :vcr do
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

    describe 'parties section' do
      let!(:user) { create :user }
      let!(:users) { create_list :user, 10 }
      let!(:parties) { create_list :party, 7 }
      let!(:hosted_parties) { [parties[1], parties[3], parties[6]] }
      let!(:invited_parties) { parties - hosted_parties }

      before :each do
        users << user
        parties.each do |party|
          party.users << users
          if !hosted_parties.include?(party)
            party.invitations.create_host(users[0..-2].sample.id)
          end
        end

        hosted_parties.each do |party|
          party.invitations.create_host(user.id)
        end

        allow_any_instance_of(ApplicationController).to receive(:current_user)
          .and_return(user)

        visit dashboard_path
      end

      it 'has users hosted parties' do
        hosted_parties.each do |party|
          within("#party-#{party.id}") do
            expect(page).to have_link(party.movie_title)
            expect(page).to have_content(party.formatted_duration)
            expect(page).to have_content(party.date.strftime('%b %-d, %Y'))
            expect(page).to have_content(party.start_time.strftime('%I:%M %P'))
            expect(page).to have_content('Hosting')
            expect(page).to_not have_content('Invited')
          end
        end
      end

      it 'has link to movie show page' do
        within("#party-#{hosted_parties.first.id}") do
          click_on hosted_parties.first.movie_title
        end
        expect(current_path).to eq(details_path)
        expect(page).to have_content('Dilwale Dulhania Le Jayenge')
      end

      it 'has users invited parties' do
        invited_parties.each do |party|
          within("#party-#{party.id}") do
            expect(page).to have_link(party.movie_title)
            expect(page).to have_content(party.formatted_duration)
            expect(page).to have_content(party.date.strftime('%b %-d, %Y'))
            expect(page).to have_content(party.start_time.strftime('%I:%M %P'))
            expect(page).to have_content('Invited')
            expect(page).to_not have_content('Hosting')
          end
        end
      end
    end

    describe 'friends section' do
      let(:user) { create :user }
      let!(:friends) { create_list :user, 3 }

      before :each do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_path
      end

      it 'does not start with friends' do
        expect(page).to have_content('You are friendless')
      end

      context 'form to add friends' do
        it 'adds friend when the searched user exists' do
          fill_in 'email', with: friends.first.email
          click_on 'Add Friend'
          expect(page).to have_content('Friend added!')
          expect(page).to have_content(friends.first.email)
        end

        it 'does not add friend when the searched user does not exists' do
          fill_in 'email', with: 'random@email.com'
          click_on 'Add Friend'
          expect(page).to have_content('Friend not found.')
        end

        it 'doesnt add friends with blank entry' do
          fill_in 'email', with: ''
          click_on 'Add Friend'
          expect(page).to have_content('Friend not found.')
        end
      end
    end
  end
end
