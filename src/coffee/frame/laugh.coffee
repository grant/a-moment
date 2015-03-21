Frame = require './Frame'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 15x9 "ha!"
class FrameLaugh extends Frame
  getPatterns: ->
    design =
    """
    ```````````````
    ```┌┐``````┌┐``
    ```||``````||``
    ```||``````└┘``
    ```|└-┐┌-┐`````
    ```|┌┐|||└┐┌┐``
    ```└┘└┘└--┘└┘``
    ```````````````
    ```````````````
    """
    hands = ClockWallPatternUtils.toClockWallPattern(design)

    hands

module.exports = FrameLaugh
