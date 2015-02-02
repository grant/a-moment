curve = require 'timing-function'
ClockWallInterpolator = require './ClockWallInterpolator'
EASE_IN_OUT_BEZIER = curve.get 0.42, 0, 0.58, 1

# A helper singleton that can interpolate the frames/patterns of an animation sequence.
# i.e. give AnimationSequenceInterpolator an animation sequence and time, it can give back the frame for that time
AnimationSequenceInterpolator =
  # Sets the interpolator pattern
  setAnimationSequence: (@animationSequence) ->

  # Gets an interpolated pattern given a time
  getPattern: (time) ->
    # Get the start and end pattersn/times
    i = 0
    currTime = 0
    endTimeFound = false
    while !endTimeFound and i != @animationSequence.size()
      currDuration = @animationSequence.durations[i]
      currTime += currDuration
      if currTime > time
        endTimeFound = true
        startTime = currTime - currDuration
        endTime = currTime
        percentage = (endTime - time) / currDuration
      else
        ++i

    pattern = null
    if endTimeFound
      prevPattern = @animationSequence.patterns[i]
      nextPattern = @animationSequence.patterns[i + 1]
      timeRatio = EASE_IN_OUT_BEZIER percentage
      pattern = ClockWallInterpolator.getPattern prevPattern, nextPattern, timeRatio

    pattern