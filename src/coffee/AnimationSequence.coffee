# An animation sequence is an array of frames where each frame includes:
# * A pattern
# * A duration (ms)
class AnimationSequence

  # Initializes an animation sequence with a pattern
  # @param pattern A single pattern
  constructor: (pattern) ->
    @patterns = []
    @durations = []
    if pattern
      @patterns.push pattern
      @durations.push 0

  # Returns a concatted animation sequence
  concat: (animationSequences...) ->
    for sequence in animationSequences
      @patterns = @patterns.concat(sequence.patterns)
      @durations = @durations.concat(sequence.durations)
    @

  # Adds a frame
  # @param pattern The next frame's pattern.
  # @param duration The duration that frame (ms)
  addFrame: (pattern, duration) ->
    # If first pattern, add it
    @patterns.push pattern
    @durations.push duration
    @

  # Gets the size of the sequence
  size: ->
    @patterns.length

module.exports = AnimationSequence