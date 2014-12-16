# A helper singleton that can generate clock rotations
# for interpolation between two keyframe clock rotations
ClockInterpolator =
  # Interpolates the clock rotations
  getClockRotations = (startRotations, endRotations, numFrames) ->


module.exports = ClockInterpolator