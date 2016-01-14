require 'json'

class Till
  attr_reader :order
  attr_reader :menu

  def initialize(order_klass)
    @order_klass = order_klass
    @menu = JSON.parse(File.read('hipstercoffee.json'))
  end

  def start_order
    @order = @order_klass.new
  end

  def add_name_to_order(name)
    @order.set_customer_name(name)
  end

  def add_item_to_order(item)
    invalid_item_msg = "Invalid item: \"#{item}\" does not exist on the menu"
    raise invalid_item_msg unless valid_items.include?(item)
  end

  private

  def valid_items
    @menu[0]['prices'][0].keys
  end

end
