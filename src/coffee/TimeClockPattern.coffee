ClockPattern = require './ClockPattern'
NumberClockPattern = require './NumberClockPattern'

# A clock pattern that displays a time in the format HH:mm
class TimeClockPattern extends ClockPattern
  constructor: (@hours, @minutes) ->

  #
  # Public methods
  #

  getClockAngles: ->

  #
  # Private Methods
  #

  # Gets the 3x7 pattern for the number
  getNumber = (~~number) ->
    if 0 <= number <= 9
      return NumberClockPattern[number]
    else
      return null


module.exports = TimeClockPattern