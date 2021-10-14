require 'rails_helper'

RSpec.describe Party do
  describe 'relationships' do
    it { should have_many(:invitations).dependent(:destroy) }
    it { should have_many(:users).through(:invitations) }
  end
end
