ClockPattern = require './ClockPattern'
NumberClockPattern = require './NumberClockPattern'

# A clock pattern that displays a time in the format HH:mm
class TimeClockPattern extends ClockPattern
  # Sets the time for this 24 hour clock
  # @param hours The clock hours (24h) (0-23)
  # @param minutes The clock minutes (0-59)
  constructor: (@hours, @minutes) ->

  #
  # Public methods
  #

  # Sets the time
  setTime: (@hours, @minutes) ->

  # Gets the pattern
  getPattern: () ->
    # Get clock patterns for time digits
    timeNumberPatterns = getTimeNumberPatterns()

    # Create

  #
  # Private Methods
  #

  # Gets the 3x7 pattern for the number
  getNumber = (number) ->
    if 0 <= number <= 9
      return NumberClockPattern[number]
    else
      return null

  # Gets the clock patterns for each digit of the time (hours and minutes)
  getTimeNumberPatterns = () ->
    hourTens = getNumber(~~(@hours / 10))
    hourOnes = getNumber(@hours % 10)
    minuteTens = getNumber(~~(@minutes / 10))
    minuteOnes = getNumber(@minutes % 10)

    # Return all four digits
    return [hourTens, hourOnes, minuteTens, minuteOnes]

module.exports = TimeClockPattern