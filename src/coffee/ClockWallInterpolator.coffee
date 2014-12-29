ClockWallPattern = require './ClockWallPattern'
ClockInterpolator = require './ClockInterpolator'

# A helper singleton that can generate clock wall patterns
# by interpolating it's clocks
ClockWallInterpolator =
  # Interpolates the patterns
  getPatterns: (startPattern, endPattern, numFrames, interpolationSpeed) ->
    width = startPattern[0].length
    height = startPattern.length

    # Create the empty patterns
    patterns = []
    for i in [0...numFrames]
      patterns[i] = new ClockWallPattern(width, height)

    # Create temporary clocks interpolation array
    # Stores interpolations at an (x, y)
    clocks = []

    # Go through the whole grid of clocks
    for y in [0...height]
      clocks[y] = []
      for x in [0...width]
        startRotation = startPattern[y][x]
        endRotation = endPattern[y][x]
        # Generate the interpolation over n=numFrames
        clocks[y][x] = ClockInterpolator.getClockRotations(startRotation, endRotation, numFrames, interpolationSpeed)

    # Format the patterns correctly
    for i in [0...numFrames]
      # Go throught the whole grid of clocks
      pattern = patterns[i]
      handsGrid = []
      for y in [0...height]
        handsGrid[y] = []
        for x in [0...width]
          handsGrid[y][x] = clocks[y][x][i]
      pattern.setHandPositions(handsGrid)

    patterns

module.exports = ClockWallInterpolator