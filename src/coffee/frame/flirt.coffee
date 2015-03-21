Frame = require './Frame'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 15x9 Pair of eyes, one winking
class FrameLaugh extends Frame
  getPatterns: ->
    design =
    """
    ```````````````
    ``````````◰◳```
    ```◰-◳```◤``◥``
    ``◤```◥`◤``````
    ```◰-◳```◰-◳```
    ``<`()>````````
    ```◱-◲`````````
    ```````````````
    ```````````````
    """
    hands = ClockWallPatternUtils.toClockWallPattern(design)

    # Manual fixes to design
    hands[5][8] = hands[5][8].map (val) -> val + 45

    hands

module.exports = FrameLaugh
