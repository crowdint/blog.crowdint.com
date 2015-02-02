require 'spec_helper'

describe CategoriesController do
  let(:category) { create :category }

  describe '#show' do
    before { get :show, id: category.id }

    it { expect(response).to be_success }
    it { expect(response).to render_template :show }
  end
end
