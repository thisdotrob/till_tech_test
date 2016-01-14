class Till

  attr_reader :order

  def initialize(order_klass)
    @order_klass = order_klass
  end

  def start_order
    @order = @order_klass.new
  end

  def add_name_to_order(name)
    @order.set_customer_name(name)
  end

end
