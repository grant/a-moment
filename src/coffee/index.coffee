$ = require 'jquery'
ClockWallManager = require './ClockWallManager'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Set default clock pattern
  clockWallManager = new ClockWallManager(numClocksWide, numClocksTall)

  $clockWall = $('.clockwall')

  # Start animation
  start = ->
    clockWallManager.startAnimation()
    timeStart = undefined
    startScale = 5
    endScale = 1.3
    duration = 1000
    $clockWall.delay(6000).animate { opacity: 1 },
      duration: duration
      step: (now, fx) ->
        if !timeStart
          timeStart = new Date().getTime()
        timeDifference = Math.min (new Date().getTime() - timeStart), duration
        timeRatio = timeDifference / duration
        scale = startScale - (startScale - endScale) * timeRatio
        $(this).css('transform', 'scale(' + scale + ')')
      complete: ->
        $(this).css('transform', 'scale(' + endScale + ')')

  # Setup start configuration
  setup = ->
    # Hide all clocks besides the center one
    # $('.clock').addClass('hide')
    # middleIndex = Math.ceil((numClocksWide * numClocksTall) / 2)
    # $('.clock:nth-child(' + middleIndex + ')').addClass('middle-clock').removeClass('hide')

    # # Start with one clock (1x1), go to 7x7, then 15x9
    # $clockWall.css('transform', 'scale(5)')

    # $('.start.button').click ->
    #   $('.start.button').addClass 'hide'
    #   start()

  setup()
