# An animation sequence is an array of frames where each frame includes:
# * A pattern
# * A duration (ms)
class AnimationSequence

  # Initializes an animation sequence with a pattern and a duration for that pattern
  # @param pattern A single pattern or array of patterns
  # @param duration A single duration or array of durations
  constructor: (pattern, duration) ->
    @patterns = [].concat(pattern)
    @durations = [].concat(duration)

  # Returns a concatted animation sequence
  concat: (animationSequence) ->
    newPatterns = @patterns.concat(animationSequence.patterns)
    newDurations = @durations.concat(animationSequence.durations)
    return new AnimationSequence(newPatterns, newDurations)