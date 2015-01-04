Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 15x9 coffee
class FrameDrink extends Frame
  getPatterns: ->
    design =
    """
    ```````````````
    ``````<<<``````
    ``````>>>``````
    ``````<<<``````
    `````┌vvv┐-┐```
    `````|---|`◶```
    -----└---┘◲----
    ┌┐┌┐┌┐◱-◲┐┌┐┌┐┌
    ┘└┘└┘└┘└┘└┘└┘└┘
    """
    hands = ClockWallPatternUtils.toClockWallPattern(design)

    hands

module.exports = FrameDrink