Frame = require './Frame'
FrameMoment = require './moment'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 15x9 Pair of eyes, one winking
class FrameLaugh extends Frame
  getPatterns: ->
    hands = new FrameMoment().getPatterns()

    design =
    """
      ^ ^
     ◢`v`◣
    «--^--»
     ◱-v-◲

    """
    pattern = ClockWallPatternUtils.toClockWallPattern(design)

    hands = ClockWallPatternUtils.place(hands, pattern, 'center')

    # # Manual fixes to design
    lipEdgeCurve = 10
    hands[4][4] = hands[4][4].map (val) ->
      if val == 180
        val -= lipEdgeCurve
      val
    hands[4][10] = hands[4][10].map (val) ->
      if val == 0
        val += lipEdgeCurve
      val

    hands

module.exports = FrameLaugh