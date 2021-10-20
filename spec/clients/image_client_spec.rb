require 'rails_helper'

RSpec.describe ImageClient, :vcr do
  it 'returns a url' do
    result = ImageClient.fetch
    expect(result).to be_a(Hash)
    expect(result).to have_key(:image)
  end
end
