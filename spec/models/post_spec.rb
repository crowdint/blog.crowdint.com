require 'spec_helper'

describe Post do
  let(:post) { create :post }

  describe '#formatted_published_date' do
    it { expect(post.formatted_published_date).to eq('Dec 15, 2014') }
  end
  describe 'relationships' do
    it { should belong_to(:category) }
  end
end
