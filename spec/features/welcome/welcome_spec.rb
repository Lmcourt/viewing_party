require 'rails_helper'

RSpec.describe 'welcome' do
  describe 'welcome page' do
    before :each do
      visit root_path
    end

    it 'has a login button' do
      click_on 'Login'
      expect(current_path).to eq(login_path)
    end

    it 'has registration button' do
      click_on 'Sign Up'
      expect(current_path).to eq(register_path)
    end
  end
end
