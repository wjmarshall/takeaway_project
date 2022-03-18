class OrderConfirmation
  attr_reader :order, :order_time

  def initialize(order, order_time)
    @order = order
    @order_time = order_time
  end

  def delivery_estimate(minutes)
    @delivery_estimate = @order_time + minutes * 60
  end

  def message
    "Thank you! Your order was placed and will be delivered before #{@delivery_estimate.strftime("%k:%M")}"
  end

end