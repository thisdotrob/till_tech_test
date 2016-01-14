require 'till'

describe Till do

  subject { Till.new }

  context '#initialize' do
    it 'is initialized with no order' do
      expect(subject.order).to be_nil
    end
  end

end
