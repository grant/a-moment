$ = require 'jquery'
ClockManager = require './ClockManager'
TimeClockPattern = require './TimeClockPattern'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  clockManager = new ClockManager(numClocksWide, numClocksTall)

  clockManager.getClock(0, 0).setHands([90, 100])

  clockPattern = new TimeClockPattern(numClocksWide, numClocksTall)
  clockPattern.setTime(22, 34)
  clockManager.setPattern(clockPattern.getHandPositions())