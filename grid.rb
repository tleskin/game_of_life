class Grid
  attr_reader :rows_of_cells

  def initialize(rows, columns)
    @rows_of_cells = Array.new()
    rows.times do
      @rows_of_cells << columns.times.map { Cell.new([false, true].sample) }
    end
    @row = nil
    @column = nil
  end

  def calc_alive(row, column)
    @row = row
    @column = column

    current_status = cell.alive? ? 1 : 0

    cell.live_count = neighbors.select {|c| c.alive?}.count - current_status
  end

  def cell
    @rows_of_cells[@row][@column]
  end

  def rows
    @rows_of_cells[min_check(@row)..count_max_rows]
  end

  def neighbors
    rows.flat_map {|r| r[min_check(@column)..count_max_columns]}
  end

  def count_max_rows
    max_check(@row, (@rows_of_cells.length - 1))
  end

  def count_max_columns
    max_check(@column, (@rows_of_cells.first.length - 1))
  end

  def max_check(number, max)
    number >= max ? max : number + 1
  end

  def min_check(number)
    number == 0 ? number : number - 1
  end

  def tick
    @rows_of_cells.each_with_index do |r, i|
      r.each_with_index do |c, j|
        calc_alive(i, j)
      end
    end

    @rows_of_cells.each {|r| r.each {|c| c.tick }}
  end

  def draw
    @rows_of_cells.each {|r| r.each {|c| c.display} ; puts ""}
  end
end
