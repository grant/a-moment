$ = require 'jquery'
Clock = require './Clock'

# The manager for the clock wall
class ClockManager
  constructor: (@numClocksWide, @numClocksTall) ->
    # Cache references to all clocks
    @clocks = loadClocks(numClocksWide, numClocksTall)

  #
  # Public Methods
  #

  # Gets a single clock
  getClock: (x, y) -> @clocks[y][x]

  # Sets the current clock pattern
  setPattern: (pattern) ->
    for y in [0..@numClocksTall - 1]
      for x in [0..@numClocksWide - 1]
        @getClock(x, y).setHands(pattern[y][x])

  #
  # Private Methods
  #

  # Returns a 2D array of all clock elements
  loadClocks = (numClocksWide, numClocksTall) ->
    $allClocks = $ '.clock'

    # Create empty clocks 2D array
    clocks = []
    for i in [0..numClocksTall - 1]
      clocks[i] = []

    # Populate clocks array
    for $clock, i in $allClocks
      y = ~~(i / numClocksWide)
      x = i % numClocksWide
      clocks[y][x] = new Clock(x, y, $ $clock)

    return clocks

module.exports = ClockManager