$ = require 'jquery'
Clock = require './Clock'

# The manager for the clock wall.
# Manages the current state of the clocks and the queue of next clock patterns.
class ClockManager
  constructor: (@numClocksWide, @numClocksTall) ->
    # Cache references to all clocks
    @clocks = _loadClocks(numClocksWide, numClocksTall)
    @patternQueue = []

  # ## Public Methods

  # Gets a single clock
  getClock: (x, y) ->
    @clocks[y][x]

  # Sets the current clock pattern
  setPattern: (pattern) ->
    if pattern
      for y in [0..@numClocksTall - 1]
        for x in [0..@numClocksWide - 1]
          @getClock(x, y).setHands(pattern[y][x])

  # Adds an array of patterns to the next clock patterns queue.
  queuePatterns: (patterns) ->
    @patternQueue = @patternQueue.concat(patterns)

  # Sets the current pattern to the next one in the queue
  nextPattern: ->
    @setPattern @patternQueue.shift()

  # ## Private Methods

  # Returns a 2D array of all clock elements
  _loadClocks = (numClocksWide, numClocksTall) ->
    $allClocks = $ '.clock'

    # Create empty clocks 2D array
    clocks = []
    for i in [0..numClocksTall - 1]
      clocks[i] = []

    # Populate clocks array
    for clock, i in $allClocks
      y = ~~(i / numClocksWide)
      x = i % numClocksWide
      clocks[y][x] = new Clock(x, y, $ clock)

    return clocks

module.exports = ClockManager