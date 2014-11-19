$ = require 'jquery'
ClockManager = require './ClockManager'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  clockManager = new ClockManager(numClocksWide, numClocksTall)

  clockManager.getClock(0, 0).setHands(90, 100)