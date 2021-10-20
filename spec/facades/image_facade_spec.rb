require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  describe 'avatar images' do
    it 'returns fox image' do
      result = ImageFacade.image
      expect(result).to be_a(String)
    end
  end
end
