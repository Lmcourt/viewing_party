require 'rails_helper'

RSpec.describe 'User session' do
  describe 'login' do
    let!(:user) { create :user }

    before :each do
      visit login_path
    end

    context 'with valid params' do
      it 'logs in the user' do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password

        click_on 'Submit'

        expect(current_path).to eq(dashboard_path(user))
        expect(page).to have_content("Welcome back, #{user.email}!")
      end
    end

    context 'without valid params' do
      it 'rejects invalid email' do
        fill_in 'email', with: 'notmyemail'
        fill_in 'password', with: user.password

        click_on 'Submit'

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Invalid email or password.")
      end

      it 'rejects incorrect password' do
        fill_in 'email', with: user.email
        fill_in 'password', with: 'notmypassword'

        click_on 'Submit'

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Invalid email or password.")
      end
    end
  end

  describe 'logout' do
    it 'logs out the user' do
      user = create(:user)

      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password

      click_on 'Submit'

      click_on 'Logout'

      expect(current_path).to eq(root_path)
    end
  end
end
