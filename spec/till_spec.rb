require 'till'

describe Till do

  subject { Till.new }

  context '#initialize' do
    it 'is initialized with no order' do
      expect(subject.order).to be_nil
    end
  end

  context '#start_order' do
    it 'starts an order' do
      subject.start_order
      expect(subject.order).to_not be_nil
    end
  end

end
