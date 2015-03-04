require 'spec_helper'

describe Crowdblog::PostsController do
  let!(:author) { create :user }
  let!(:new_post) { create :post, author: author, published_at: '2015-01-01' }
  let!(:old_post) { create :post, author: author, published_at: '2014-01-01' }

  describe '#index' do
    before { get :index }

    it { expect(assigns :page).to eq '1' }
    it { expect(assigns :recent_post).to eq new_post }
  end
end
