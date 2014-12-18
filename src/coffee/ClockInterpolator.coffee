interpolationSpeed = 5

# A helper singleton that can generate clock rotations
# for interpolation between two keyframe clock rotations
ClockInterpolator =
  # Interpolates the clock rotations
  getClockRotations = (startRotations, endRotations, numFrames) ->
    # Get the rotations to be between 0-360
    zeroToThreeSixty = (val) -> val % 360
    startRotations = startRotations.map zeroToThreeSixty
    endRotations = endRotations.map zeroToThreeSixty

    interpolateSpeed = 1 / numFrames
    progress = interpolateSpeed

    # Interpolate with a max speed until completed
    rotations = []
    # for i in 0..numFrames
      # console.log i

module.exports = ClockInterpolator