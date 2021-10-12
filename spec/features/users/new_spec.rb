require 'rails_helper'

RSpec.describe 'New user' do
  describe 'registration' do
    before :each do
      visit registration_path
    end

    context 'with valid params' do
      let(:user) { build :user }

      it 'creates a new user' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password

        click_on 'Submit'

        expect(User.count).to eq(1)
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Welcome #{user.email}!")
      end
    end

    context 'without valid params' do
      let(:email) { Faker::Internet.email }
      let(:password) { 'password' }

      it 'rejects invalid email' do
        fill_in 'user[email]', with: 'email'
        fill_in 'user[password]', with: password
        fill_in 'user[password_confirmation]', with: password

        click_on 'Submit'

        expect(User.count).to eq(0)
        expect(current_path).to eq(registration_path)
        expect(page).to have_content('Invalid credentials. Please try again.')
      end

      it 'rejects empty password' do
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: password

        click_on 'Submit'

        expect(User.count).to eq(0)
        expect(current_path).to eq(registration_path)
        expect(page).to have_content('Invalid credentials. Please try again.')
      end

      it 'rejects empty password confirmation' do
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        fill_in 'user[password_confirmation]', with: ''

        click_on 'Submit'

        expect(User.count).to eq(0)
        expect(current_path).to eq(registration_path)
        expect(page).to have_content('Invalid credentials. Please try again.')
      end

      it 'rejects non identical passwords' do
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        fill_in 'user[password_confirmation]', with: 'chicken'

        click_on 'Submit'

        expect(User.count).to eq(0)
        expect(current_path).to eq(registration_path)
        expect(page).to have_content('Invalid credentials. Please try again.')
      end
    end
  end
end
