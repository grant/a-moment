$ = require 'jquery'
ClockWallManager = require './ClockWallManager'

# Full-screen on mobile
# See http://www.html5rocks.com/en/mobile/fullscreen/
window.scrollTo(0,1);

$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Set default clock pattern
  ClockWallManager = new ClockWallManager(numClocksWide, numClocksTall)