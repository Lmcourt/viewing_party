require 'rails_helper'

RSpec.describe ReviewPoro do
  let(:review) { ReviewPoro.new({ author: 'Tanner', content: 'It was bad.' }) }

  it 'has attributes' do
    expect(review.author).to eq('Tanner')
    expect(review.content).to eq('It was bad.')
  end
end
