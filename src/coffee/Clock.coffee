class Clock
  constructor: (@x, @y, @$el) ->
    $hands = $el.find '.hand'
    @$hand1 = $hands.eq(0)
    @$hand2 = $hands.eq(1)
    @hand1Rotation = 0
    @hand2Rotation = 0

  # Sets the rotation of the hands
  # Guarantees the hands will rotate using the minimum distance
  setHands: (rotations) ->
    rotation1 = rotations[0]
    rotation2 = rotations[1]
    # Helper method.
    # Returns the minimum distance between two angles
    minRotDist = (rot1, rot2) ->
      dist = rot1 - rot2
      (dist + 180) % 360 - 180

    # Calculate the distances between both options
    # Option 1: Hand 1 rotates to rotation1, Hand 2 rotates to rotation2
    # Option 2: Hand 1 rotates to rotation2, Hand 2 rotates to rotation1
    option1RotDist = minRotDist(rotation1, @hand1Rotation) + minRotDist(rotation2, @hand2Rotation)
    option2RotDist = minRotDist(rotation1, @hand2Rotation) + minRotDist(rotation2, @hand1Rotation)
    if option1RotDist < option2RotDist
      @hand1Rotation = rotation1
      @hand2Rotation = rotation2
    else
      @hand1Rotation = rotation2
      @hand2Rotation = rotation1

    # Set transform
    @$hand1.css('transform', "rotate(#{@hand1Rotation}deg)")
    @$hand2.css('transform', "rotate(#{@hand2Rotation}deg)")

module.exports = Clock