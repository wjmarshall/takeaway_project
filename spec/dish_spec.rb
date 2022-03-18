require "dish"

RSpec.describe Dish do
  subject(:dish) { Dish.new("Fish and chips", Money.from_cents(1000, "GBP")) }
  it "accepts and returns a name and price" do
    expect(dish.name).to eq("Fish and chips")
    expect(dish.price).to eq(Money.from_cents(1000, "GBP"))
  end
end
