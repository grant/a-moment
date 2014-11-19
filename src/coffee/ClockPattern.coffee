class ClockPattern
  # Sets the clock pattern's dimensions (width and height)
  constructor: (@numClocksWide, @numClocksTall) ->
    # Create the default pattern
    @pattern = []
    for y in [0..@numClocksTall - 1]
      @pattern[y] = []
      for x in [0..@numClocksWide - 1]
        @pattern[y][x] = [0, 180]

module.exports = ClockPattern