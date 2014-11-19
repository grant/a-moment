$ = require 'jquery'
ClockManager = require './ClockManager'

$ ->
  numClocksWide = 15
  numClocksTall = 9

  clockManager = new ClockManager(numClocksWide, numClocksTall)

  clockManager.getClock 5, 2
  # $clocks[0][0].find('.hand').css('transform', 'rotate(90deg)')