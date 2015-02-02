# A helper singleton that can interpolate the frames/patterns of an animation sequence.
# i.e. give AnimationSequenceInterpolator an animation sequence and time, it can give back the frame for that time
AnimationSequenceInterpolator =
  # Sets the interpolator pattern
  setAnimationSequence: (@animationSequence) ->

  # Gets an interpolated pattern given a time
  getPattern: (time) ->
