require 'json'

class Receipt

  def initialize(order, prices, tax_rate)
    @order = order
    @prices = prices
    @tax_rate = tax_rate
  end

  def getJSON
    items = parsed_items
    receipt = {
      name: order.customer_name,
      items: items,
      totals: calculate_totals(items)
    }
    JSON.generate(receipt)
  end

  private

  attr_reader :order
  attr_reader :prices
  attr_reader :tax_rate

  def parsed_items
    order.items.map do |name, q|
      total = (prices[name.to_s] * q).round(2)
      { name: name, quantity: q.to_s, total: total.to_s }
    end
  end

  def calculate_totals(items)
    pre_tax_total = items.inject(0) { |total, item| total + item[:total].to_f }
    after_tax = (pre_tax_total * (1 + tax_rate)).round(2)
    tax = (after_tax - pre_tax_total).round(2)
    { after_tax: after_tax.to_s, tax: tax.to_s }
  end

end
