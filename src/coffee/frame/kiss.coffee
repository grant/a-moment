Frame = require './Frame'
FrameMoment = require './moment'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 15x9 Pair of eyes, one winking
class FrameLaugh extends Frame
  getPatterns: ->
    hands = new FrameMoment().getPatterns()

    # Design must have odd dimensions to center properly
    design =
    """
      ^ ^
     ◢`v`◣
    «--^--»
     ◱-v-◲

    """
    pattern = ClockWallPatternUtils.toClockWallPattern(design)

    hands = ClockWallPatternUtils.place(hands, pattern, 'center')

    # ## Manual fixes to design
    lipEdgeCurve = 10
    hands[4][5] = hands[4][5].map (val) ->
      if val == 180
        val -= lipEdgeCurve
      val
    hands[4][9] = hands[4][9].map (val) ->
      if val == 0
        val += lipEdgeCurve
      val

    hands

module.exports = FrameLaugh