$ = require 'jquery'
$ ->
  numClocksWide = 15
  numClocksTall = 9

  # Returns a 2D array of all clock elements
  getClocks = ->
    $allClocks = $ '.clock'

    # Create empty $clocks 2D array
    $clocks = []
    for i in [0..numClocksTall - 1]
      $clocks[i] = []

    # Populate $clocks array
    for $clock, i in $allClocks
      y = ~~(i / numClocksWide)
      x = i % numClocksWide
      $clocks[y][x] = $ $clock

    return $clocks

  setRotation = ($clock, hand1Rotation, hand2Rotation) ->
    console.log 'hi'

  # Cache references to all clocks
  $clocks = getClocks()

  # setRotation($clock[])
  $clocks[0][0].find('.hand').css('transform', 'rotate(90deg)')