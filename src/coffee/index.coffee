$ = require 'jquery'
ClockManager = require './ClockManager'

ClockPattern = require './ClockPattern'
TimeClockPattern = require './TimeClockPattern'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Set default clock pattern
  clockManager = new ClockManager(numClocksWide, numClocksTall)
  clockPattern = new ClockPattern(numClocksWide, numClocksTall)
  clockManager.setPattern(clockPattern.getHandPositions())

  # Queue patterns
  clockManager.queuePatterns([])
  # setTimeout ->
  #   clockPattern = new TimeClockPattern(numClocksWide, numClocksTall)
  #   clockPattern.setTime(10, 67)
  #   clockManager.setPattern(clockPattern.getHandPositions())
  # , 10