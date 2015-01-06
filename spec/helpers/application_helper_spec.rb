require 'spec_helper'

describe ApplicationHelper do
  describe '#custom_link' do
    it 'builds a custom link' do
      expect(helper.custom_link('ola k ace', '#', class: 'yolo')).
        to eq "<a class=\"yolo\" href=\"#\">ola k ace</a>"
    end
  end

  describe '#index_page?' do
    context 'index page' do
      it 'returns index' do
        params = { controller: 'crowdblog/posts', action: 'index' }
        allow(helper).to receive(:params).and_return(params)
        expect(helper.index_page?).to eq 'index'
      end
    end

    context 'another page' do
      it 'returns nil' do
        params = { controller: 'crowdblog/posts', action: 'show' }
        allow(helper).to receive(:params).and_return(params)
        expect(helper.index_page?).to eq nil
      end
    end
  end
end
