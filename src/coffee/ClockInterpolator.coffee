# Math.sign shim
Math.sign = require 'math-sign'
defaultRotationSpeed = 50 # 50 degrees per second

# A helper singleton that can generate clock rotations
# for interpolation between two keyframe clock rotations
ClockInterpolator =
  # Interpolates the clock rotation given a current time
  getClockRotation: (startRotation, endRotation, currTime, rotationSpeed = defaultRotationSpeed) ->
    # Get the rotations to be between 0-360
    zeroToThreeSixty = (val) -> val % 360
    startRotation = zeroToThreeSixty startRotation
    endRotation = zeroToThreeSixty endRotation

    # Interpolate with a max speed until completed
    speed0 = rotationSpeed * Math.sign(endRotation[0] - startRotation[0])
    rot0 = startRotation[0] + speed0 * currTime
    if Math.abs(endRotation[0] - startRotation[0]) < Math.abs(speed0 * currTime)
      rot0 = endRotation[0]
    speed1 = rotationSpeed * Math.sign(endRotation[1] - startRotation[1])
    rot1 = startRotation[1] + speed1 * currTime
    if Math.abs(endRotation[1] - startRotation[1]) < Math.abs(speed1 * currTime)
      rot1 = endRotation[1]

    [rot0, rot1]

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
      if Math.abs(endRotations[0] - startRotations[0]) < Math.abs(speed0 * (i + 1))
        rot0 = endRotations[0]
      speed1 = interpolationSpeed * Math.sign(endRotations[1] - startRotations[1])
      rot1 = startRotations[1] + speed1 * (i + 1)
      if Math.abs(endRotations[1] - startRotations[1]) < Math.abs(speed1 * (i + 1))
        rot1 = endRotations[1]
      rotations.push [rot0, rot1]

    rotations

module.exports = ClockInterpolator