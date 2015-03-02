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

  describe '.date_range' do
    it 'returns the dates if they are present' do
      dates = { from: '2015-01-01', to: '2015-03-01' }
      expect(Post.date_range(dates)).to eq '2015-01-01'..'2015-03-01'
    end

    it 'returns custom dates if they are not present' do
      dates = { from: '', to: '' }
      expect(Post.date_range(dates)).
        to eq '2010-01-01'..Date.today.end_of_month.to_s
    end
  end

  describe '.grouped_for_archive' do
    let!(:post_2015) do
      create :post, author: author, published_at: Date.new(2015, 01, 15)
    end

    it 'returns the posts sorted by years' do
      expect(Post.grouped_for_archive.keys).to eq [2015, 2014]
    end
  end
end

