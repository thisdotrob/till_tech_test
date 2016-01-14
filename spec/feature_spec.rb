require 'till'
require 'order'

describe 'Feature' do
  let(:mock_menu){ JSON.parse(File.read('spec/testmenu.json')) }
  subject { Till.new(Order, 'spec/testmenu.json') }

  context 'till startup' do
    it 'starts with an empty order and a menu' do
      expect(subject.order.is_a?(Order)).to be true
      expect(subject.menu).to eq(mock_menu)
    end
  end

end
