require 'rails_helper'

RSpec.describe RecommendationPoro do
  let(:recommendation) { RecommendationPoro.new({ id: 1, title: 'Good Movie' }) }

  it 'has attributes' do
    expect(recommendation.id).to eq(1)
    expect(recommendation.title).to eq('Good Movie')
  end
end
