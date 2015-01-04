CommonClockWallPattern = require './CommonClockWallPattern'
NumberClockWallPattern = require './NumberClockWallPattern'

# A clock pattern that displays a time in the format HH:mm
class TimeClockWallPattern
  constructor: (numClocksWide, numClocksTall) ->
    super(numClocksWide, numClocksTall)
    @hours = 0
    @minutes = 0

  # ## Public methods

  # Sets the time for this 24 hour clock
  # @param hours The clock hours (24h) (0-23)
  # @param minutes The clock minutes (0-59)
  setTime: (@hours, @minutes) ->

  # Gets the pattern
  getHandPositions: ->
    # Get clock patterns for time digits
    timeNumberPatterns = _getTimeNumberPatterns(@hours, @minutes)

    # Reset the hand positions
    @setHandPositions(CommonClockWallPattern.horizontal(@width, @height))

    # Add the digits to the hand positions
    positionOrigins = [[1, 1], [4, 1], [8, 1], [11, 1]]
    for numberPattern, i in timeNumberPatterns
      origin = positionOrigins[i]
      for y in [0..numberPattern.length - 1]
        for x in [0..numberPattern[0].length - 1]
          @_hands[y + origin[1]][x + origin[0]] = numberPattern[y][x]

    return @_hands

  # ## Private Methods

  # Gets the 3x7 pattern for the number
  _getNumber = (number) ->
    if 0 <= number <= 9
      return NumberClockWallPattern[number]
    else
      return null

  # Gets the clock patterns for each digit of the time (hours and minutes)
  _getTimeNumberPatterns = (hours, minutes) ->
    hourTens = _getNumber(~~(hours / 10))
    hourOnes = _getNumber(hours % 10)
    minuteTens = _getNumber(~~(minutes / 10))
    minuteOnes = _getNumber(minutes % 10)

    # Return all four digits
    return [hourTens, hourOnes, minuteTens, minuteOnes]

module.exports = TimeClockWallPattern