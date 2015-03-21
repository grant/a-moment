Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# The X pattern with two squares moving apart
class FrameBreakup extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Background pattern
    xPatternTemplate = CommonClockWallPattern.x(width, height)

    # Design must have odd dimensions to center properly
    keyframeObjects = [
      """
      ┌┌┐
      |||
      └┘┘
      """
    ,
      """
      ┌-┌-┐
      | | |
      └-┘-┘
      """
    ,
      """
      ┌-┐ ┌-┐
      | | | |
      └-┘ └-┘
      """
    ,
      """
      ┌-┐   ┌-┐
      | |   | |
      └-┘   └-┘
      """
    ,
      """
      ┌-┐     ┌-┐
      | |     | |
      └-┘     └-┘
      """
    ,
      """
      ┌-┐       ┌-┐
      | |       | |
      └-┘       └-┘
      """
    ,
      """
      ┌-┐         ┌-┐
      | |         | |
      └-┘         └-┘
      """
    ,
      """
      ┌-┐           ┌-┐
      | |           | |
      └-┘           └-┘
      """
    ,
      """
      ┌-┐             ┌-┐
      | |             | |
      └-┘             └-┘
      """
    ,
      """
      ┌-┐               ┌-┐
      | |               | |
      └-┘               └-┘
      """
    ]
    hands = []
    for keyframeObject in keyframeObjects
      keyframePattern = ClockWallPatternUtils.toClockWallPattern(keyframeObject)
      xPatternClone = ClockWallPatternUtils.clone xPatternTemplate
      hands.push ClockWallPatternUtils.place(xPatternClone, keyframePattern, 'center')

    hands

module.exports = FrameBreakup
