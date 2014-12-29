$ = require 'jquery'
ClockWallManager = require './ClockWallManager'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Set default clock pattern
  ClockWallManager = new ClockWallManager(numClocksWide, numClocksTall)