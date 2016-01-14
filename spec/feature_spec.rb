require 'till'
require 'order'

describe 'Feature' do
  let(:mock_menu){ JSON.parse(File.read('spec/testmenu.json')) }
  subject { Till.new(Order, 'spec/testmenu.json') }

  context 'till startup' do
    it 'starts with an empty order and a menu read from the .json' do
      expect(subject.order.is_a?(Order)).to be true
      expect(subject.menu).to eq(mock_menu)
    end
  end

  context 'placing an order' do
    it 'returns a receipt in the correct json string format' do
      expected_receipt = {
        name: 'Bob',
        items: [
          { name: 'Tiramisu', quantity: '1', total: '11.4' },
          { name: 'Cafe Latte', quantity: '5', total: '23.75' }
        ],
        totals: { after_tax: '38.19', tax: '3.04' }
      }
      expected_json = JSON.generate(expected_receipt)
      subject.add_name_to_order('Bob')
      subject.add_item_to_order('Tiramisu')
      5.times { subject.add_item_to_order('Cafe Latte') }
      expect(subject.receipt).to eq(expected_json)
    end
  end

end
