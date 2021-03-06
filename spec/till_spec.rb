require 'till'

describe Till do
  let(:order){ double('order') }
  let(:order_klass){ double('order_klass', new: order) }
  let(:receipt){ double('receipt') }
  let(:receipt_klass){ double('receipt_klass', new: receipt) }
  let(:mock_menu){ JSON.parse(File.read('spec/testmenu.json')) }
  subject { Till.new(order_klass, receipt_klass, 'spec/testmenu.json') }

  context '#initialize' do
    it 'starts an order' do
      expect(subject.order).to eq(order)
    end

    it 'reads in the menu from .json file' do
      expect(subject.menu).to eq(mock_menu)
    end
  end

  describe 'Creating an order' do
    context '#add_name_to_order' do
      it 'assigns a customer\'s name to the order' do
        expect(order).to receive(:set_customer_name).with('Bob')
        subject.add_name_to_order('Bob')
      end
    end

    context '#add_item_to_order' do
      it 'raises error if item does not exist in the menu' do
        msg = 'Invalid item: "beer" does not exist on the menu'
        expect { subject.add_item_to_order('beer') }.to raise_error(msg)
      end

      it 'adds a valid item to the order' do
        expect(order).to receive(:add_item).with('Cappucino')
        subject.add_item_to_order('Cappucino')
      end
    end
  end

  describe 'Getting a receipt' do

  end

end
