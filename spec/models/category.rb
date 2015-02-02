require 'spec_helper'

describe Category do
  let(:category) { create :category}

  describe 'relationships' do
    it { expect(category).to have_and_belong_to_many(:posts) }
  end

  describe '#to_param' do
    it 'returns id and name parameterized' do
      category_param = "#{ id }=#{ name.parameterize }"
      expect(category.to_param).to eq category_param
    end
  end
end
