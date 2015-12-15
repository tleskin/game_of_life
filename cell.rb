class Cell
  attr_accessor :alive, :live_count

  def initialize(state = false)
    @alive = state
    @live_count = 0
  end

  def alive?
    @alive
  end

  def toggle!
    @alive = !@alive
  end

  def tick
    if should_toggle
      toggle!
    end
  end

  def over_or_under_populated?
    @alive && (@live_count < 2 || @live_count > 3)
  end

  def reproduce?
    !@alive && @live_count == 3
  end

  def should_toggle
    over_or_under_populated? || reproduce?
  end

  def display
    print @alive ? "X" : "."
  end
end
