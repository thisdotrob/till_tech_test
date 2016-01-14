require 'till'

describe Till do
  let(:order){ double('order') }
  let(:order_klass){ double('order_klass', new: order) }
  subject { Till.new(order_klass) }

  context '#initialize' do
    it 'is initialized with no order' do
      expect(subject.order).to be_nil
    end

    it 'is initialized with a menu read in from .json file' do
      expected_menu = JSON.parse(File.read('hipstercoffee.json'))
      expect(subject.menu).to eq(expected_menu)
    end
  end

  describe 'Creating an order' do
    before do
      subject.start_order
    end

    context '#start_order' do
      it 'starts an order' do
        expect(subject.order).to eq(order)
      end
    end

    context '#add_name_to_order' do
      it 'assigns a customer\'s name to the order' do
        expect(order).to receive(:set_customer_name).with("Bob")
        subject.add_name_to_order("Bob")
      end
    end
  end

end
