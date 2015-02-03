ClockWallInterpolator = require './ClockWallInterpolator'

# A helper singleton that can interpolate the frames/patterns of an animation sequence.
# i.e. give AnimationSequenceInterpolator an animation sequence and time, it can give back the frame for that time
class AnimationSequenceInterpolator
  # Sets the interpolator pattern
  constructor: (@animationSequence) ->

  # Gets an interpolated pattern given a time
  getPattern: (time) ->
    # Get the start and end pattersn/times
    i = 0
    endTime = 0
    endTimeFound = false
    while !endTimeFound and i != @animationSequence.size()
      currDuration = @animationSequence.durations[i]
      endTime += currDuration
      if endTime > time
        endTimeFound = true
        startTime = endTime - currDuration
        percentage = (endTime - time) / currDuration
      else
        ++i

    pattern = null
    if endTimeFound
      prevPattern = @animationSequence.patterns[i]
      nextPattern = @animationSequence.patterns[i + 1]
      currTime = time - startTime
      pattern = ClockWallInterpolator.getPattern prevPattern, nextPattern, currTime

    pattern

module.exports = AnimationSequenceInterpolator