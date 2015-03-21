Frame = require './Frame'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 15x9 phone with text messages
class FrameText extends Frame
  getPatterns: ->
    design =
    """
    ```````````````
    `````┌---┐`````
    `````|.--|`````
    `````|--.|`````
    `````|.--|`````
    `````|.--|`````
    `````|^^^|`````
    `````└---┘`````
    ```````````````
    """
    hands = ClockWallPatternUtils.toClockWallPattern(design)

    hands

module.exports = FrameText
