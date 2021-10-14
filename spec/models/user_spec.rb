require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation).on(:create) }
  end

  describe 'relationships' do
    it { should have_many(:invitations) }
    it { should have_many(:parties).through(:invitations) }
  end
end
