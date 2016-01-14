require 'order'

describe Order do
  subject { Order.new }

  context '#initialize' do
    it 'is initialized with an empty list of items' do
      expect(subject.items).to eq({})
    end

    it 'is initialized with an empty name' do
      expect(subject.customer_name).to eq('')
    end
  end

  context '#set_customer_name' do
    it 'sets the customer name' do
      subject.set_customer_name('Bob')
      expect(subject.customer_name).to eq('Bob')
    end
  end

  context '#add_item' do
    it 'adds an item to the order' do
      3.times { subject.add_item('Tiramisu') }
      expect(subject.items).to eq({Tiramisu: 3})
    end
  end

end
