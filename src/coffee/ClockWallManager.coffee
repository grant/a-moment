$ = require 'jquery'
curve = require 'timing-function'
raf = require 'raf'
Animator = require './Animator'
AnalogClock = require './AnalogClock'
Clock = require './Clock'
ClockWallInterpolator = require './ClockWallInterpolator'
AnimationSequenceInterpolator = require './AnimationSequenceInterpolator'
TimeClockWallPattern = require './TimeClockWallPattern'
CommonClockWallPattern = require './CommonClockWallPattern'
Frame = require './Frame'

# Constants
ANALOG_CLOCK_DATE_OFFSET_ACCELERATION = 1.03
ANALOG_CLOCK_TRANSLATE_UP = -10 # px
EASE_IN_OUT_BEZIER = curve.get 0.42, 0, 0.58, 1
MODE =
  HOME: 'home'
  HOME_TO_MEDIUM_VIEW: 'home_to_medium_view'
  # MEDIUM_VIEW = 7x7
  MEDIUM_VIEW: 'medium_view'
  MEDIUM_VIEW_TO_LARGE_VIEW: 'medium_view_to_large_view'
  # LARGE_VIEW = 15x9
  LARGE_VIEW: 'large_view'
  LARGE_VIEW_TO_END: 'large_view_to_end'
  END: 'end'

# The manager for the clock wall.
# Manages the current state of the clocks and the queue of next clock patterns.
class ClockWallManager
  constructor: (@numClocksWide, @numClocksTall) ->
    self = @
    @mode = MODE.HOME

    # Cache references to all clocks
    @clocks = _loadClocks(numClocksWide, numClocksTall)
    @analogClock = @clocks[Math.floor(numClocksTall / 2)][Math.floor(numClocksWide / 2)]

    # Start the analog clock
    analogClock = @analogClock
    analogClock.getElement().css('transform', 'translateY(' + ANALOG_CLOCK_TRANSLATE_UP + 'px)')
    dateOffset = 0
    dateOffsetSpeed = 2

    # Get animation sequence
    animationSequence = Animator.getAnimationSequence()
    interpolator = new AnimationSequenceInterpolator animationSequence
    startTime = new Date

    # Setup raf (60 fps)
    tick = =>
      raf tick

      # Accelerate analog clock speed
      if @mode == MODE.HOME_TO_MEDIUM_VIEW
        dateOffset += dateOffsetSpeed
        dateOffsetSpeed *= ANALOG_CLOCK_DATE_OFFSET_ACCELERATION
        dateOffsetSpeed = dateOffsetSpeed

      # Update analog clock
      if @mode in [MODE.HOME, MODE.HOME_TO_MEDIUM_VIEW]
        date = new Date
        date.setTime date.getTime() - dateOffset
        analogClock.updateHands(date)

      animationTime = new Date().getTime() - startTime.getTime()
      pattern = interpolator.getPattern animationTime
        @setPattern pattern

    raf tick

  # ## Public Methods

  # Starts the main animation
  startAnimation: ->
    @mode = MODE.HOME_TO_MEDIUM_VIEW

    # Move the middle clock back to place
    moveClockToMiddleDuration = 500
    moveClockToMiddleDelay = 4000
    setTimeout =>
      $captionArea = $('.overlay .caption-area')

      # Move middle clock
      startTime = new Date().getTime()
      moveClockToMiddleDuration = 500
      $('.middle-clock').animate
        opacity: 1
      ,
        duration: moveClockToMiddleDuration
        step: ->
          timeDifference = Math.min (new Date().getTime() - startTime), moveClockToMiddleDuration
          timeRatio = timeDifference / moveClockToMiddleDuration
          easeRatio = EASE_IN_OUT_BEZIER timeRatio
          y = ANALOG_CLOCK_TRANSLATE_UP + (-ANALOG_CLOCK_TRANSLATE_UP * easeRatio)
          $(this).css('transform', 'translateY(' + y + 'px)')

          $captionArea.css('transform', 'translateY(' + (y - ANALOG_CLOCK_TRANSLATE_UP) + 'px)')
        end: ->
          $captionArea.css('transform', 'translateY(0)')

      # Fade out caption
      $('.overlay .caption-area').fadeOut(moveClockToMiddleDuration)
    , moveClockToMiddleDelay

    # Bring in 7x7 clocks
    fadeInWidth = 7
    fadeInHeight = 7
    startX = (@numClocksWide - fadeInWidth) / 2
    startY = (@numClocksTall - fadeInHeight) / 2
    endX = startX + fadeInWidth
    endY = startY + fadeInHeight
    moveAnimationDuration = 1500
    moveAnimationDelay = 6000
    setTimeout =>
      # Go through all the clocks and fade them in
      startTime = new Date().getTime()
      for y in [startY...endY]
        for x in [startX...endX]
          if !(x == Math.floor(@numClocksWide / 2) and y == Math.floor(@numClocksTall / 2))
            $clock = @clocks[y][x].getElement()
            $clock.removeClass 'hide'
            xOffset = -(Math.floor(fadeInWidth / 2) - x + startX) * 100
            yOffset = -(Math.floor(fadeInHeight / 2) - y + startY) * 100
            $clock.css
              transform: 'translate(' + xOffset + 'px, ' + yOffset + 'px)'
            # Closure to wrap offset variables
            (($clock, xOffset, yOffset) ->
              $clock.animate
                opacity: 1
              ,
                duration: moveAnimationDuration
                step: ->
                  timeDifference = Math.min (new Date().getTime() - startTime), moveAnimationDuration
                  timeRatio = timeDifference / moveAnimationDuration
                  easeRatio = EASE_IN_OUT_BEZIER timeRatio
                  inverseTimeRatio = 1 - easeRatio
                  newXOffset = xOffset * inverseTimeRatio
                  newYOffset = yOffset * inverseTimeRatio
                  $clock.css
                    transform: 'translate(' + newXOffset + 'px, ' + newYOffset + 'px)'
            )($clock, xOffset, yOffset)
    , moveAnimationDelay

    # Set mode to medium view
    setTimeout =>
      @mode = MODE.MEDIUM_VIEW

      # Fade out analog clock second hand
      @analogClock.removeSecondHand()
    , moveAnimationDelay + moveAnimationDuration


  # Gets a single clock
  getClock: (x, y) ->
    @clocks[y][x]

  # Sets the current clock pattern
  setPattern: (pattern) ->
    if pattern
      for y in [0...@numClocksTall]
        for x in [0...@numClocksWide]
          @getClock(x, y).setHands(pattern[y][x])

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