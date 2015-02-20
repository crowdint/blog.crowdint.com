require 'spec_helper'

describe Post do
  let!(:author) { create :user }
  let!(:post) { create :post, author: author }

  describe '#formatted_published_date' do
    it { expect(post.formatted_published_date).to eq('Dec 15, 2014') }
  end

  describe 'relationships' do
    it { expect(post).to have_and_belong_to_many(:categories) }
  end
end

