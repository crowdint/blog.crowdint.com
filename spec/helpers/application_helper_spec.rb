require 'spec_helper'

describe ApplicationHelper do
  describe '#custom_link' do
    it 'builds a custom link' do
      expect(helper.custom_link('ola k ace', '#', class: 'yolo')).
        to eq "<a class=\"yolo\" href=\"#\">ola k ace</a>"
    end
  end
end
