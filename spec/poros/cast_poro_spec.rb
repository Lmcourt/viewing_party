require 'rails_helper'

RSpec.describe CastPoro do
  let(:cast) { CastPoro.new({ character: 'Tom', name: 'Jerry' }) }

  it 'has attributes' do
    expect(cast.character).to eq('Tom')
    expect(cast.name).to eq('Jerry')
  end
end
