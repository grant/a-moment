# Represents the data for a single clock pattern frame
class ClockWallPattern
  # Sets the clock pattern's dimensions (width and height)
  constructor: (@numClocksWide, @numClocksTall) ->
    if !numClocksWide or !numClocksTall
      throw 'Parameters required'
    # Create the default pattern
    @resetHandPositions()

  # Getter for hand positions
  getHandPositions: -> @_hands

  # Setter for hand positions
  setHandPositions: (hands) -> @_hands = hands

  # Resets hand positions
  resetHandPositions: ->
    @_hands = []
    for y in [0..@numClocksTall - 1]
      @_hands[y] = []
      for x in [0..@numClocksWide - 1]
        @_hands[y][x] = [Math.random() * 360, Math.random() * 360]

module.exports = ClockWallPattern