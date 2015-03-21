Frame = require './Frame'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A stock market graph going up and to the right
class FrameSuccess extends Frame
  getPatterns: ->
    design =
    """
    ╝╚╝╚╝╚╝╚╝╚╝╚╝╚╝╚╝╚◢
    ╗╔╗╔╗╔╗╔╗╔╗╔╗╔╗╔╗◢|
    ╝╚╝╚╝╚╝╚╝╚╝╚╝╚◰-◲||
    ╗╔╗╔╗╔╗╔╗╔╗╔╗◢|||||
    ╝╚╝╚╝╚╝╚◰◳╝╚◢||||||
    ╗╔◰◳╗╔╗◢||◱◲|||||||
    ╝◢||◱-◲||||||||||||
    ◢||||||||||||||||||
    |||||||||||||||||||
    """
    hands = ClockWallPatternUtils.toClockWallPattern(design)

    hands

module.exports = FrameSuccess
