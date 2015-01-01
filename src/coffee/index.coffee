$ = require 'jquery'
ClockWallManager = require './ClockWallManager'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Set default clock pattern
  ClockWallManager = new ClockWallManager(numClocksWide, numClocksTall)

  # Setup start configuration

  # Hide all clocks besides the center one
  # $('.clock').addClass('hide')
  # middleIndex = Math.ceil((numClocksWide * numClocksTall) / 2)
  # $('.clock:nth-child(' + middleIndex + ')').addClass('middle-clock').removeClass('hide')

  # # Start with one clock (1x1), go to 7x7, then 15x9
  $('.clockwall').addClass('view-large')