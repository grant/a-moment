$ = require 'jquery'
Clock = require './Clock'
ClockWallPattern = require './ClockWallPattern'
ClockWallInterpolator = require './ClockWallInterpolator'
TimeClockWallPattern = require './TimeClockWallPattern'


# The manager for the clock wall.
# Manages the current state of the clocks and the queue of next clock patterns.
class ClockWallManager
  constructor: (@numClocksWide, @numClocksTall) ->
    # Cache references to all clocks
    @clocks = _loadClocks(numClocksWide, numClocksTall)

    # Load default clock pattern
    @setPattern(new ClockWallPattern(numClocksWide, numClocksTall))
    @patternQueue = []

    timePattern = new TimeClockWallPattern(numClocksWide, numClocksTall)
    timePattern.setTime(10, 67)
    pattern1 = timePattern.getHandPositions()
    timePattern.setTime(34, 12)
    pattern2 = timePattern.getHandPositions()

    patterns = ClockWallInterpolator.getPatterns(pattern1, pattern2, 1000, 1)

    @queuePatterns(patterns)
    self = @
    setInterval ->
      self.nextPattern()
    , 10


  # ## Public Methods

  # Gets a single clock
  getClock: (x, y) ->
    @clocks[y][x]

  # Sets the current clock pattern
  setPattern: (pattern) ->
    if pattern
      handRotations = pattern.getHandPositions()
      for y in [0..@numClocksTall - 1]
        for x in [0..@numClocksWide - 1]
          @getClock(x, y).setHands(handRotations[y][x])

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

module.exports = ClockWallManager