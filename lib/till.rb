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

end
