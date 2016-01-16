require 'order'

describe Order do
  subject { Order.new }

  context '#initialize' do
    it 'is initialized with an empty list of items' do
      expect(subject.instance_variable_get(:@items)).to eq({})
    end

    it 'is initialized with an empty name' do
      expect(subject.instance_variable_get(:@customer_name)).to eq('')
    end
  end

  context '#set_customer_name' do
    it 'sets the customer name' do
      subject.set_customer_name('Bob')
      expect(subject.instance_variable_get(:@customer_name)).to eq('Bob')
    end
  end

  context '#add_item' do
    it 'adds an item to the order' do
      3.times { subject.add_item('Tiramisu') }
      expect(subject.instance_variable_get(:@items)).to eq({Tiramisu: 3})
    end
  end

  context '#customer_name' do
    it 'returns the customer\'s name' do
      expect(subject.customer_name).to eq('')
    end
  end

  context '#items' do
    it 'returns the ordered items' do
      subject.instance_variable_set(:@items, {Tiramisu: 3})
      expect(subject.items).to eq({Tiramisu: 3})
    end
  end

end
