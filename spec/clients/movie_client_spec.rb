require 'rails_helper'

RSpec.describe MovieClient, :vcr do
  it 'returns 1 page of 20 results' do
    result = MovieClient.fetch('/3/discover/movie?language=en-US&sort_by=vote_average.desc&page=2')
    result = result[:results]
    expect(result.size).to eq(20)
    expect(result).to be_a(Array)
  end
end
