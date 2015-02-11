require 'spec_helper'

describe ErrorsController do
  describe '#file_not_found' do
    before { get :file_not_found }

    it { expect(response).to render_template('errors/error') }
    it { expect(response.status).to eq 404 }
  end

  describe '#internal_server_error' do
    before { get :internal_server_error }

    it { expect(response).to render_template('errors/error') }
    it { expect(response.status).to eq 500 }
  end
end
