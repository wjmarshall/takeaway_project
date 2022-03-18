require "order"

RSpec.describe Order do
  subject(:order) { Order.new }
  let(:dish_1) { double(:dish_1, name: "Fish and chips", price: Money.from_cents(1000, "GBP")) }
  let(:dish_2) { double(:dish_2, name: "Steak and ale pie", price: Money.from_cents(1050, "GBP")) }

  context "when initialized" do
    it "is empty until dishes are added" do
      expect(order.dishes).to eq({})
      expect(order.total_price).to eq(Money.new(0, "GBP"))
    end
  end

  context "when dishes are added to the order" do
    it "stores and returns a list of dishes and order quantities" do
      order.add(dish_1, 2)
      expect(order.dishes).to eq({ dish_1 => 2 })
      order.add(dish_2)
      expect(order.dishes).to eq({ dish_1 => 2, dish_2 => 1 })
    end
  end

  context "given a list of dishes and quantities" do
    it "calculates the total order price" do
      order.add(dish_1, 2)
      order.add(dish_2)
      expect(order.total_price).to eq(Money.from_cents(3050, "GBP"))
    end
  end

end
