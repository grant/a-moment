HandRotationUtils = require './HandRotationUtils'

# Common clock wall patterns
CommonClockWallPattern =
  # Empty
  # Note: This is an invalid pattern to display
  empty: (width, height) ->
    pattern = []
    for y in [0...height]
      pattern[y] = []
      for x in [0...width]
        pattern[y][x] = []

    pattern


  # Horizontal lines
  #
  # Example (2x2)
  # ──
  # ──
  horizontal: (width, height) ->
    fillPatternSingleRotation(width, height, HandRotationUtils.toHandRotation('-'))

  # Vertical lines
  #
  # Example (2x2)
  # ││
  # ││
  vertical: (width, height) ->
    fillPatternSingleRotation(width, height, HandRotationUtils.toHandRotation('|'))

  # Diagonal right lines
  #
  # Example (2x2)
  # \\
  # \\
  diagonalRight: (width, height) ->
    fillPatternSingleRotation(width, height, HandRotationUtils.toHandRotation('\\'))

  # Diagonal left lines
  #
  # Example (2x2)
  # //
  # //
  diagonalLeft: (width, height) ->
    fillPatternSingleRotation(width, height, HandRotationUtils.toHandRotation('/'))

  # X lines
  # Overflow repeat
  #
  # Example (2x2)
  # \/
  # /\
  x: (width, height) ->
    xDesign = HandRotationUtils.toHandRotation([
      '\\/'
      '/\\'
    ])
    fillPatternGridRotation(width, height, xDesign)

  # Square lines
  # Overflow repeat
  #
  # Example (2x2)
  # ┌┐
  # └┘
  square: (width, height) ->
    squareDesign = HandRotationUtils.toHandRotation([
      '┌┐'
      '└┘'
    ])
    fillPatternGridRotation(width, height, squareDesign)

  # Zigzag horizontal
  # Overflow repeat
  #
  # Example (2x2)
  # ┌┐
  # ┘└
  zigzagHorizontal: (width, height) ->
    zigzagHorizontalDesign = HandRotationUtils.toHandRotation([
      '┌┐'
      '┘└'
    ])
    fillPatternGridRotation(width, height, zigzagHorizontalDesign)

  # Zigzag vertical
  # Overflow repeat
  #
  # Example (2x2)
  # ┘┌
  # ┐└
  zigzagVertical: (width, height) ->
    zigzagVerticalDesign = HandRotationUtils.toHandRotation([
      '┘┌'
      '┐└'
    ])
    fillPatternGridRotation(width, height, zigzagVerticalDesign)

  # Spiral
  # Covers whole wall
  #
  # Example (3x3, 'bottom-right', 'cw')
  # ┌-┐
  # |||
  # |└┘
  #
  # Options:
  # - start: 'top-left', 'top-right', 'bottom-left', 'bottom-right'
  # - direction: 'cw', 'ccw'
  #
  spiral: (width, height, start = 'top-left', direction = 'cw') ->
    # Generate the 2d array
    pattern = fillPatternSingleRotation(width, height)

    # Directions at ['top-left', 'top-right', 'bottom-right', 'bottom-left']
    cwDirections = ['right', 'down', 'left', 'up']
    ccwDirections = ['down', 'left', 'up', 'right']

    directionId = (direction) -> cwDirections.indexOf(direction)

    # Corner characters when hitting [right, down, left, up]
    # Contains (cw, ccw) rotations
    rotationChar = [
      ['┐', '┘']
      ['┘', '└']
      ['└', '┌']
      ['┌', '┐']
    ]

    cw = (direction == 'cw')
    if cw
      directions = cwDirections
    else
      directions = ccwDirections

    # Find start position and direction
    switch start
      when 'top-left'
        startPosition = [0, 0]
        directionsIndex = 0
      when 'top-right'
        startPosition = [width - 1, 0]
        directionsIndex = 1
      when 'bottom-right'
        startPosition = [width - 1, height - 1]
        directionsIndex = 2
      when 'bottom-left'
        startPosition = [0, height - 1]
        directionsIndex = 3

    # Now iterate through the spiral until we reach the end
    position = startPosition

    # Create borders when hitting [right, down, left, up]
    right = width - 1
    bottom = height - 1
    left = 0
    top = 0

    rotationCharIndex = +!cw
    i = 0
    while right >= left and top <= bottom
      ++i

      # Set the current clock's hand rotations
      direction = directions[directionsIndex]
      switch direction
        when 'right'
          # Hit edge, rotate
          if position[0] == right
            handRotations = HandRotationUtils.toHandRotation(rotationChar[directionId(direction)][rotationCharIndex])
            if cw
              directionsIndex = (directionsIndex + 1) % 4
              ++top
            else
              directionsIndex = (directionsIndex + 3) % 4
              --bottom
          else
            handRotations = HandRotationUtils.toHandRotation('-')
        when 'down'
          # Hit edge, rotate
          if position[1] == bottom
            handRotations = HandRotationUtils.toHandRotation(rotationChar[directionId(direction)][rotationCharIndex])
            if cw
              directionsIndex = (directionsIndex + 1) % 4
              --right
            else
              directionsIndex = (directionsIndex + 3) % 4
              ++left
          else
            handRotations = HandRotationUtils.toHandRotation('|')
        when 'left'
          # Hit edge, rotate
          if position[0] == left
            handRotations = HandRotationUtils.toHandRotation(rotationChar[directionId(direction)][rotationCharIndex])
            if cw
              directionsIndex = (directionsIndex + 1) % 4
              --bottom
            else
              directionsIndex = (directionsIndex + 3) % 4
              ++top
          else
            handRotations = HandRotationUtils.toHandRotation('-')
        when 'up'
          # Hit edge, rotate
          if position[1] == top
            handRotations = HandRotationUtils.toHandRotation(rotationChar[directionId(direction)][rotationCharIndex])
            if cw
              directionsIndex = (directionsIndex + 1) % 4
              ++left
            else
              directionsIndex = (directionsIndex + 3) % 4
              --right
          else
            handRotations = HandRotationUtils.toHandRotation('|')

      pattern[position[1]][position[0]] = handRotations

      # Force the middle of the spiral to be straight
      if i == width * height
        if (direction in ['up', 'down'])
          pattern[position[1]][position[0]] = HandRotationUtils.toHandRotation('|')
        else
          pattern[position[1]][position[0]] = HandRotationUtils.toHandRotation('-')

      # Move to the next clock
      direction = directions[directionsIndex]
      switch direction
        when 'right' then ++position[0]
        when 'down' then ++position[1]
        when 'left' then --position[0]
        when 'up' then --position[1]

    pattern

# Fills a pattern with the specified handRotation design
fillPatternSingleRotation = (width, height, handRotations) ->
  fillPatternGridRotation(width, height, [[handRotations]])

# Fills a pattern with overflow of the given grid rotation
fillPatternGridRotation = (width, height, gridRotations) ->
  pattern = []
  rotations =
    width: gridRotations[0].length
    height: gridRotations.length
  for y in [0...height]
    pattern[y] = []
    for x in [0...width]
      pattern[y][x] = gridRotations[y % rotations.height][x % rotations.width]

  pattern

module.exports = CommonClockWallPattern