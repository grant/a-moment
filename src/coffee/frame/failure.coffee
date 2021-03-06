Frame = require './Frame'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# An arrow animating downward
class FrameFailure extends Frame
  getPatterns: ->
    arrowDesign =
    """
       |---|
       |---|
       |---|
       |---|
       |---|
    ⤥--┘---└--⤦
     ◥-------◤
      ◥-----◤
       ◥---◤
        ◥-◤
         ⌵
    """
    hands = ClockWallPatternUtils.toClockWallPattern(arrowDesign)

    # Animate the arrow down

    hands

module.exports = FrameFailure
