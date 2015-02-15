Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 7x7 short maze
class FrameSearch extends Frame
  getPatterns: ->

    # A maze.
    design =
    """
    ┌┐┌┐┌┐┌┐┌┐└┘└┘``└┘└
    └┘└┘└┘└┘└┘┌┐````┌┐┌
    ```````|◹◿└┘````└┘└
    ```````|◸◺┌┐┌┐``┌┐┌
    ┐``┌┐``|``└┘└┘``└┘└
    ┘``└┘`````┌┐┌┐`````
    ```┌┐`````└┘└┘`````
    ```└┘┌┐┌┐┌┐┌┐┌┐┌┐┌┐
    ┐┌┐┌┐└┘└┘└┘└┘└┘└┘└┘
    """
    hands = ClockWallPatternUtils.toClockWallPattern(design)

    hands

module.exports = FrameSearch