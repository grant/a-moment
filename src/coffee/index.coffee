$ = require 'jquery'
ClockWallManager = require './ClockWallManager'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Set default clock pattern
  ClockWallManager = new ClockWallManager(numClocksWide, numClocksTall)

  # Hide all clocks besides the center one
  $('.clock').addClass('hide')
  middleIndex = Math.ceil((numClocksWide * numClocksTall) / 2)
  $('.clock:nth-child(' + middleIndex + ')').removeClass('hide')