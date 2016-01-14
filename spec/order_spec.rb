require 'order'

describe Order do
  subject { Order.new }

  context '#set_customer_name' do
    it 'sets the customer name' do
      subject.set_customer_name('Bob')
      expect(subject.customer_name).to eq('Bob')
    end
  end

end
