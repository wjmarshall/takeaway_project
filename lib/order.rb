class Order
  attr_reader :dishes, :total_price

  def initialize
    @dishes = {}
  end

  def add(dish, qty=1)
    @dishes[dish] = qty
  end

  def total_price
    total_price = Money.new(0, "GBP")
    @dishes.each do |dish, qty|
      total_price += dish.price * qty
    end
    total_price
  end

end