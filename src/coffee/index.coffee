$ = require 'jquery'
ClockWallManager = require './ClockWallManager'

ClockWallPattern = require './ClockWallPattern'
ClockInterpolator = require './ClockInterpolator'
TimeClockWallPattern = require './TimeClockWallPattern'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Set default clock pattern
  ClockWallManager = new ClockWallManager(numClocksWide, numClocksTall)
  ClockWallPattern = new ClockWallPattern(numClocksWide, numClocksTall)
  ClockWallManager.setPattern(ClockWallPattern.getHandPositions())

  # Queue patterns
  ClockWallManager.queuePatterns([])
  # setTimeout ->
  #   ClockWallPattern = new TimeClockWallPattern(numClocksWide, numClocksTall)
  #   ClockWallPattern.setTime(10, 67)
  #   ClockWallManager.setPattern(ClockWallPattern.getHandPositions())
  # , 10