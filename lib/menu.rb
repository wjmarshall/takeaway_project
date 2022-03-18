class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def format
    formatted = @dishes.map do |dish| 
      "#{dish.name}: #{dish.price.format}"
    end
    formatted.join("\n")
  end

end
