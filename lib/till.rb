require 'json'

class Till
  TAX_RATE = 0.0864
  attr_reader :order
  attr_reader :menu

  def initialize(order_klass, receipt_klass, menu_filename)
    @receipt_klass = receipt_klass
    @order = order_klass.new
    @menu = JSON.parse(File.read(menu_filename))
  end

  def add_name_to_order(name)
    self.order.set_customer_name(name)
  end

  def add_item_to_order(item)
    invalid_item_msg = "Invalid item: \"#{item}\" does not exist on the menu"
    raise invalid_item_msg unless valid_items.include?(item)
    self.order.add_item(item)
  end

  def receipt
    @receipt_klass.new(self.order, prices, TAX_RATE).getJSON
  end

  private

  def valid_items
    prices.keys
  end

  def prices
    self.menu[0]['prices'][0]
  end

end
