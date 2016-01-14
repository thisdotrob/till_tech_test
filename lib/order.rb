class Order
  attr_reader :customer_name
  attr_reader :items

  def initialize
    @customer_name = ''
    @items = {}
  end

  def set_customer_name(name)
    @customer_name = name
  end

  def add_item(item)
    item = item.to_sym
    @items[item] ? @items[item] += 1 : @items[item] = 1
  end

end
