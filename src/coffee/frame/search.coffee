Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 7x7 short maze
class FrameSearch extends Frame
  getPatterns: ->
    pacmanTemplate =
      right:
        """
        ◢◺
        ◥◸
        """
      down:
        """
        ◢◣
        ◹◸
        """
      left:
        """
        ◿◣
        ◹◤
        """
      up:
        """
        ◿◺
        ◥◤
        """

    # A maze.
    mapTemplate =
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
    hands = ClockWallPatternUtils.toClockWallPattern(mapTemplate)

    # Place pacman in positions (top left)
    positions = [
      [3, 2, 'right']
      [4, 2, 'right']
      [4, 3, 'down']
      [4, 4, 'down']
      [4, 5, 'down']
      [5, 5, 'right']
      [6, 5, 'right']
      [7, 5, 'right']
      [7, 4, 'up']
    ]

    mapsWithPositions = []
    for position in positions
      [x, y, pos] = position
      mapClone = ClockWallPatternUtils.clone mapTemplate
      pacman = pacmanTemplate[pos]
      mapsWithPositions.push ClockWallPatternUtils.place(mapClone, pacman, 'topleft')

    hands

module.exports = FrameSearch