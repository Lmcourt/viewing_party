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
end
