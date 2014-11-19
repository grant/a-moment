class Clock
  constructor: (@x, @y, @$el) ->
    $hands = $el.find '.hand'
    @$hand1 = $hands.eq(0)
    @$hand2 = $hands.eq(1)

  setHands: (hand1Rotation, hand2Rotation) ->
    @$hand1.css('transform', "rotate(#{hand1Rotation}deg)")
    @$hand2.css('transform', "rotate(#{hand2Rotation}deg)")

module.exports = Clock