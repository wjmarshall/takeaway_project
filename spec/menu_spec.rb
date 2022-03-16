require "menu"

RSpec.describe Menu do
  subject(:menu) { Menu.new }
  let(:dish_1) { double(:dish_1, name: "Fish and chips", price: Money.from_cents(1000, "GBP")) }
  let(:dish_2) { double(:dish_2, name: "Steak and ale pie", price: Money.from_cents(1050, "GBP")) }

  describe "#initialize" do
    it "should set the instance variable @dishes to an empty array" do
      expect(menu.instance_variable_get(:@dishes)).to eq([])
    end
  end

  describe "#add" do
    it "should accept a dish and add it to the @dishes array" do
      menu.add(dish_1)
      expect(menu.instance_variable_get(:@dishes)).to eq([dish_1])
      menu.add(dish_2)
      expect(menu.instance_variable_get(:@dishes)).to eq([dish_1, dish_2])
    end
  end

  describe "#dishes" do
    it "should return the @dishes array" do
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.dishes).to eq([dish_1, dish_2])
    end
  end

  describe "#format" do
    it "should format the menu so that the user can see a list of dishes and prices" do
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.format).to eq("Fish and chips: £10.00\nSteak and ale pie: £10.50")
    end
  end
end