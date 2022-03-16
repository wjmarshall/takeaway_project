class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def format
    formatted = @dishes.map { |dish| "#{dish.name}: #{dish.price.format}" }
    formatted.join("\n")
  end

end
