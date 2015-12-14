require 'minitest/autorun'
require 'minitest/pride'
require_relative '../cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new
  end

  def test_it_responds_to_alive
    assert Cell.new.respond_to?(:alive?)
  end

  def test_it_can_accept_a_state
    cell = Cell.new(true)
    assert cell.respond_to?(:alive)
  end

  def test_it_can_be_toggled
    assert_equal true, @cell.toggle!
  end

  def test_after_toggled_the_state_is_opposite
    cell_state = @cell.alive?
    puts cell_state
    @cell.toggle!
    puts cell_state
    assert @cell.alive? != cell_state
  end

  def test_the_cell_state_can_be_set
    assert @cell.respond_to?(:alive=)
  end
end
