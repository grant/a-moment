$ = require 'jquery'
raf = require 'raf'
AnalogClock = require './AnalogClock'
Clock = require './Clock'
ClockWallPattern = require './ClockWallPattern'
ClockWallInterpolator = require './ClockWallInterpolator'
TimeClockWallPattern = require './TimeClockWallPattern'
CommonClockWallPattern = require './CommonClockWallPattern'

# Constants
ANALOG_CLOCK_DATE_OFFSET_ACCELERATION = 1.03

# The manager for the clock wall.
# Manages the current state of the clocks and the queue of next clock patterns.
class ClockWallManager
  constructor: (@numClocksWide, @numClocksTall) ->
    self = @

    # Cache references to all clocks
    @clocks = _loadClocks(numClocksWide, numClocksTall)
    @analogClock = @clocks[Math.floor(numClocksTall / 2)][Math.floor(numClocksWide / 2)]

    # Start the analog clock
    analogClock = @analogClock
    dateOffset = 0
    dateOffsetSpeed = 2

    # Setup raf (60 fps)
    tick = ->
      raf tick

      date = new Date
      if self.animationStarted
        dateOffset += dateOffsetSpeed
        dateOffsetSpeed *= ANALOG_CLOCK_DATE_OFFSET_ACCELERATION
        dateOffsetSpeed = dateOffsetSpeed

      console.log dateOffset

      date.setTime date.getTime() + dateOffset
      analogClock.updateHands(date)

    raf tick

    # # Load default clock pattern
    # @setPattern(new ClockWallPattern(numClocksWide, numClocksTall))
    # @patternQueue = []

    # timePattern = new TimeClockWallPattern(numClocksWide, numClocksTall)
    # timePattern.setTime(10, 67)
    # pattern1 = timePattern.getHandPositions()
    # timePattern.setTime(20, 15)
    # pattern2 = timePattern.getHandPositions()

    # speed = 10
    # patterns = ClockWallInterpolator.getPatterns(pattern1, pattern2, 360/speed, speed)

    # x = CommonClockWallPattern.x(numClocksWide, numClocksTall)
    # s = CommonClockWallPattern.square(numClocksWide, numClocksTall)
    # v = CommonClockWallPattern.vertical(numClocksWide, numClocksTall)
    # q = CommonClockWallPattern.diagonalLeft(numClocksWide, numClocksTall)
    # z1 = CommonClockWallPattern.zigzagHorizontal(numClocksWide, numClocksTall)
    # z2 = CommonClockWallPattern.zigzagVertical(numClocksWide, numClocksTall)
    # spiral = CommonClockWallPattern.spiral(numClocksWide, numClocksTall)
    # spiral2 = CommonClockWallPattern.spiral(numClocksWide, numClocksTall, 'bottom-right', 'ccw')
    # @queuePatterns(ClockWallInterpolator.getPatterns(x, spiral, 360/speed, speed))
    # @queuePatterns(ClockWallInterpolator.getPatterns(spiral, spiral2, 360/speed, speed))
    # @queuePatterns(ClockWallInterpolator.getPatterns(spiral2, z1, 360/speed, speed))
    # @queuePatterns(ClockWallInterpolator.getPatterns(z1, z2, 360/speed, speed))
    # @queuePatterns(ClockWallInterpolator.getPatterns(z2, s, 360/speed, speed))
    # @queuePatterns(ClockWallInterpolator.getPatterns(s, q, 360/speed, speed))
    # @queuePatterns(ClockWallInterpolator.getPatterns(q, v, 360/speed, speed))
    # @queuePatterns(ClockWallInterpolator.getPatterns(v, x, 360/speed, speed))
    # @queuePatterns(ClockWallInterpolator.getPatterns(x, pattern1, 360/speed, speed))
    # @queuePatterns(patterns)

    # setInterval ->
    #   self.nextPattern()
    # , 30


  # ## Public Methods

  # Starts the main animation
  startAnimation: ->
    @animationStarted = true

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

  # Returns true if the pattern queue is empty
  patternQueueIsEmpty: ->
    !@patternQueue.length

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
      if x == Math.floor(numClocksWide / 2) and y == Math.floor(numClocksTall / 2)
        clocks[y][x] = new AnalogClock($ clock)
      else
        clocks[y][x] = new Clock($ clock)

    return clocks

module.exports = ClockWallManager