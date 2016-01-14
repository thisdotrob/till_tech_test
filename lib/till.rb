require 'json'

class Till
  attr_reader :order
  attr_reader :menu

  def initialize(order_klass, menu_filename)
    @order = order_klass.new
    @menu = JSON.parse(File.read(menu_filename))
  end

  def add_name_to_order(name)
    @order.set_customer_name(name)
  end

  def add_item_to_order(item)
    invalid_item_msg = "Invalid item: \"#{item}\" does not exist on the menu"
    raise invalid_item_msg unless valid_items.include?(item)
    @order.add_item(item)
  end

  def receipt
    items = parsed_items
    receipt = {
      name: @order.customer_name, items: items, totals: calculate_totals(items)
    }
    JSON.generate(receipt)
  end

  private

  def parsed_items
    @order.items.map do |name, q|
      total = (prices[name.to_s] * q).round(2)
      { name: name, quantity: q.to_s, total: total.to_s }
    end
  end

  def calculate_totals(items)
    pre_tax_total = items.inject(0) { |total, item| total + item[:total].to_f }
    after_tax = (pre_tax_total * 1.0864).round(2)
    tax = (after_tax - pre_tax_total).round(2)
    { after_tax: after_tax.to_s, tax: tax.to_s }
  end

  def valid_items
    prices.keys
  end

  def prices
    @menu[0]['prices'][0]
  end

end
