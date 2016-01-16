require 'receipt'

describe Receipt do
  let(:prices){ { 'Tea' => 3.65 } }
  let(:order){ double('order') }
  let(:tax_rate){ 0.0864 }
  subject { Receipt.new(order, prices, tax_rate) }

  context '#initialize' do
    it 'has an order' do
      expect(subject.instance_variable_get(:@order)).to eq(order)
    end

    it 'has a list of prices' do
      expect(subject.instance_variable_get(:@prices)).to eq(prices)
    end

    it 'has a tax rate' do
      expect(subject.instance_variable_get(:@tax_rate)).to eq(tax_rate)
    end

  end

  context '#getJSON' do
    it 'returns a json string receipt in the correct format' do
      expected_receipt = {
        name: 'Basil',
        items: [{ name: 'Tea', quantity: '1', total: '3.65' }],
        totals: { after_tax: '3.97', tax: '0.32' }
      }
      expected_json = JSON.generate(expected_receipt)
      allow(order).to receive(:items).and_return({Tea: 1})
      allow(order).to receive(:customer_name).and_return('Basil')
      expect(subject.getJSON).to eq(expected_json)
    end
  end

end
