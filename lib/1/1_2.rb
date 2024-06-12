# Урок 1
# Задание 2
# реализовать класс Point, аттрибуты x, y, color. Пример использования:
# point1 = Point.new(x: 12, y: 43, color: 'black')

# point2 = Point.new do |point|
#   point.x = 12
#   point.y = 43
#   point.color = 'black'
# end

# point1 == point2 # true

class Point
  attr_accessor :x, :y, :color

  def initialize(x: nil, y: nil, color: nil)
    @x = x
    @y = y
    @color = color
    yield(self) if block_given?
  end

  def ==(point)
    point.is_a?(Point) && x == point.x && y == point.y && color == point.color
  end
end
