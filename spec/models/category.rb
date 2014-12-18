require 'spec_helper'

describe Category do
  let(:category) { create :category}

  describe 'relationships' do
    it { expect(category).to has_many(:posts) }
  end
end
