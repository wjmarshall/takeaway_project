require "dish"

RSpec.describe Dish do
  subject(:dish) { Dish.new("Fish and chips", Money.from_cents(1000, "GBP")) }
  
  describe "#initialize" do
    it "should accept a name (string) and a price (money) as arguments" do
      expect(dish.instance_variable_get(:@name)).to eq("Fish and chips")
      expect(dish.instance_variable_get(:@price)).to eq(Money.from_cents(1000, "GBP"))
    end
  end

  describe "#name" do
    it "should return the dish's name" do
      expect(dish.name).to eq("Fish and chips")
    end
  end

  describe "#price" do
    it "should return the dish's price" do
      expect(dish.price).to eq(Money.from_cents(1000, "GBP"))
    end
  end
end
