Frame = require './Frame'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A stock market graph going up and to the right
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

    # Animate the arrow down

    hands

module.exports = FrameFailure