class ClockPattern
  # Sets the clock pattern's dimensions (width and height)
  constructor: (@numClocksWide, @numClocksTall) ->
    if !numClocksWide or !numClocksTall
      throw 'Parameters required'
    # Create the default pattern
    @resetHandPositions()

  # Getter for hand positions
  getHandPositions: -> @hands

  # Resets hand positions
  resetHandPositions: ->
    @hands = []
    for y in [0..@numClocksTall - 1]
      @hands[y] = []
      for x in [0..@numClocksWide - 1]
        @hands[y][x] = [Math.random() * 360, Math.random() * 360]

module.exports = ClockPattern