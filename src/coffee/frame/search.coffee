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
        ◥◿
        """
      down:
        """
        ◢◣
        ◺◸
        """
      left:
        """
        ◸◣
        ◹◤
        """
      up:
        """
        ◿◹
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
    mapClockWallPattern = ClockWallPatternUtils.toClockWallPattern(mapTemplate)

    # Place pacman in positions (top left)
    positions = [
      [3, 2, 'right']
      [4, 2, 'right']
      [5, 2, 'right']
      [5, 3, 'down']
      [5, 4, 'down']
      [5, 5, 'down']
      [6, 5, 'right']
      [7, 5, 'right']
      [8, 5, 'right']
      [8, 4, 'up']
      [8, 3, 'up']
      [8, 2, 'up']
      [8, 2, 'left']
    ]

    mapsWithPositions = []
    for position in positions
      [x, y, pos] = position
      xy =
        x: x
        y: y
      mapClone = ClockWallPatternUtils.clone mapClockWallPattern
      pacman = ClockWallPatternUtils.toClockWallPattern pacmanTemplate[pos]
      mapsWithPositions.push ClockWallPatternUtils.place(mapClone, pacman, 'topleft', xy)

    mapsWithPositions

module.exports = FrameSearch