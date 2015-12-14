require 'minitest/autorun'
require 'minitest/pride'
require_relative '../grid'
require_relative '../cell'

class GridTest < Minitest::Test
  def setup
    @grid = Grid.new(80, 80)
  end

  def test_it_has_a_grid_of_rows_of_cells
    assert_equal 80, @grid.rows_of_cells.length
    assert_equal 80, @grid.rows_of_cells[0].length
  end

  def test_at_least_one_cell_is_alive
    assert_equal true, @grid.rows_of_cells.any? {|row| row.any? {|cell| cell.alive?}}
  end

  def test_a_cell_can_have_a_neighbor
    grid = Grid.new(3, 3)
    grid.rows_of_cells.each {|row| row.each {|cell| cell.alive = false}}
    grid.rows_of_cells[1][0].alive = true
    grid.rows_of_cells[2][1].alive = true
    grid.rows_of_cells[2][2].alive = true
    neighbors = grid.neighbors(1, 2)
    assert_equal 2, neighbors
  end

  def test_a_cell_can_have_two_neighbors
    grid = Grid.new(3, 3)
    grid.rows_of_cells.each {|row| row.each {|cell| cell.alive = false}}
    grid.rows_of_cells[1][0].alive = true
    grid.rows_of_cells[2][1].alive = true
    grid.rows_of_cells[2][2].alive = true
    neighbors = grid.neighbors(2, 0)
    assert_equal 2, neighbors
  end

  def test_a_cell_can_have_one_neighbor
    grid = Grid.new(3, 3)
    grid.rows_of_cells.each {|row| row.each {|cell| cell.alive = false}}
    grid.rows_of_cells[1][0].alive = true
    grid.rows_of_cells[2][1].alive = true
    grid.rows_of_cells[2][2].alive = true
    neighbors = grid.neighbors(0, 0)
    assert_equal 1, neighbors
  end
end
