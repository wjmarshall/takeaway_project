require "order_confirmation"

RSpec.describe OrderConfirmation do
  let(:order) { double(:order) }
  let(:order_time) { Time.new(2022, 03, 18, 19, 30, 00) }
  subject(:order_confirmation) { OrderConfirmation.new(order, order_time) }


  context "when initialized" do
    it "accepts and returns an order and an order time" do
      expect(order_confirmation.order).to eq(order)
      expect(order_confirmation.order_time).to eq(order_time)
    end
  end

  context "given an order time" do
    it "estimates a delivery time based on a given number of minutes" do
      expect(order_confirmation.delivery_estimate(40)).to eq(Time.new(2022, 03, 18, 20, 10, 00))
    end
  end

  context "based on the delivery estimate" do
    it "returns a confirmation message specifying the estimated delivery time" do
      order_confirmation.delivery_estimate(40)
      expect(order_confirmation.message).to eq("Thank you! Your order was placed and will be delivered before 20:10")
      order_confirmation.delivery_estimate(50)
      expect(order_confirmation.message).to eq("Thank you! Your order was placed and will be delivered before 20:20")
    end
  end
end