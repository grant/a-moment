$ = require 'jquery'
ClockWallManager = require './ClockWallManager'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Set default clock pattern
  clockwallmanager = new ClockWallManager(numClocksWide, numClocksTall)

  # Start animation
  start = ->
    clockwallmanager.startAnimation()

  # Setup start configuration
  setup = ->
    # Hide all clocks besides the center one
    $('.clock').addClass('hide')
    middleIndex = Math.ceil((numClocksWide * numClocksTall) / 2)
    $('.clock:nth-child(' + middleIndex + ')').addClass('middle-clock').removeClass('hide')

    # Start with one clock (1x1), go to 7x7, then 15x9
    $('.clockwall').addClass('view-large')

    $('.start.button').click ->
      start()

  setup()
