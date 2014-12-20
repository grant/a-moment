# A helper singleton that can generate clock rotations
# for interpolation between two keyframe clock rotations
ClockInterpolator =
  # Interpolates the clock rotations
  getClockRotations: (startRotations, endRotations, numFrames, interpolationSpeed = 50) ->
    # Get the rotations to be between 0-360
    zeroToThreeSixty = (val) -> val % 360
    startRotations = startRotations.map zeroToThreeSixty
    endRotations = endRotations.map zeroToThreeSixty

    # Interpolate with a max speed until completed
    rotations = []
    for i in [0...numFrames]
      speed0 = interpolationSpeed * Math.sign(endRotations[0] - startRotations[0])
      rot0 = startRotations[0] + speed0 * (i + 1)
      if endRotations[0] - startRotations[0] < speed0 * (i + 1)
        rot0 = endRotations[0]
      speed1 = interpolationSpeed * Math.sign(endRotations[1] - startRotations[1])
      rot1 = startRotations[1] + speed1 * (i + 1)
      if endRotations[1] - startRotations[1] < speed1 * (i + 1)
        rot1 = endRotations[1]
      rotations.push [rot0, rot1]

    rotations

module.exports = ClockInterpolator