require 'rails_helper'

RSpec.describe Invitation do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end

  describe 'roles' do
    let(:roles) { %w[attendee host] }

    it 'has roles' do
      Invitation.roles.keys.each_with_index do |role, i|
        expect(role).to eq(roles[i])
      end
    end
  end

  describe 'scopes' do
    let!(:users) { create_list :user, 5 }
    let!(:party) { create :party }

    before :each do
      party.users << users
    end

    it 'creates a host' do
      party.invitations.create_host(users.first.id)
      result = party.invitations.where(role: 1)
      expect(result.size).to eq(1)
      expect(result.first.user_id).to eq(users.first.id)
    end
  end
end
