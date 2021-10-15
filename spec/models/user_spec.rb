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
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:inverse_friendships) }
    it { should have_many(:inverse_friends).through(:inverse_friendships) }
  end

  describe 'instance methods' do
    let(:user) { create :user }
    let!(:friends) { create_list :user, 3 }

    before :each do
      user.friends << friends[1..]
      friends.first.friends << user
    end

    it 'has all friends' do
      expect(user.all_friends.sort_by(&:id)).to eq(friends.sort_by(&:id))
    end
  end
end
