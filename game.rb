require_relative 'grid'
require_relative 'cell'

class Game
  def initialize
    @grid = Grid.new(30, 80)
  end

  def start
    loop do
      sleep(0.1)
      @grid.draw
      @grid.tick
      `clear`
    end
  end
end

game = Game.new
game.start
