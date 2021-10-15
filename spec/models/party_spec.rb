require 'rails_helper'

RSpec.describe Party do
  describe 'relationships' do
    it { should have_many(:invitations).dependent(:destroy) }
    it { should have_many(:users).through(:invitations) }
  end

  describe 'scope' do
    let!(:users) { create_list :user, 10 }
    let!(:parties) { create_list :party, 7 }
    let!(:hosted_parties) { [parties[1], parties[3], parties[6]] }

    before :each do
      parties.each do |party|
        party.users << users
        if !hosted_parties.include?(party)
          party.invitations.create_host(users[1..].sample.id)
        end
      end

      hosted_parties.each do |party|
        party.invitations.create_host(users.first.id)
      end
    end

    it 'finds a users hosted parties' do
      result = users.first.parties.hosted
      expect(result).to eq(hosted_parties)
    end

    it 'finds parties a user is invited to' do
      result = users.first.parties.invited
      expected = parties - hosted_parties
      expect(result).to eq(expected)
    end
  end

  describe 'instance methods' do
    let!(:party) { create :party, { duration: 150 } }

    it 'has a formatted duration' do
      expect(party.formatted_duration).to eq('2 hours 30 minutes')
    end
  end
end
