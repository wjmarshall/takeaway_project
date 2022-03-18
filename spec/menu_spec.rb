require "menu"

RSpec.describe Menu do
  subject(:menu) { Menu.new }
  let(:dish_1) { double(:dish_1, name: "Fish and chips", price: Money.from_cents(1000, "GBP")) }
  let(:dish_2) { double(:dish_2, name: "Steak and ale pie", price: Money.from_cents(1050, "GBP")) }

  context "when initialized" do
    it "is empty until dishes are added to the menu" do
      expect(menu.dishes).to eq([])
    end
  end

  context "when dishes are added to the menu" do
    it "stores and returns a list of dishes" do
      menu.add(dish_1)
      expect(menu.dishes).to eq([dish_1])
      menu.add(dish_2)
      expect(menu.dishes).to eq([dish_1, dish_2])
    end
  end

  context "when formatted" do
    it "returns a list of dish names and prices" do
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.format).to eq("Fish and chips: £10.00\nSteak and ale pie: £10.50")
    end
  end

end