Frame = require './Frame'
AnimationSequence = require './AnimationSequence'

# Also see ClockInterpolator defaultRotationSpeed
defaultFrameDuration = 1000

# A magician with a dream
Animator =
  # Gets the whole animation sequence
  getAnimationSequence: ->
    sequence = new AnimationSequence().concat @_getVerse1(), @_getVerse2(), @_getVerse3()

    # ## Verse 1 (7x7)
    #
    # A moment
    # A thought
    # A dream
    # A wish
    # A search
    # A find
    # Together
    #
    # ## Verse 2 (15x9)
    #
    # A drink
    # A text
    # A laugh
    # A flirt
    # A kiss
    # A lie
    # A breakup
    #
    # ## Verse 3 (15x9)
    #
    # A game
    # A win
    # A loss
    # A success
    # A failure
    # A try
    # To do better

    sequence

  # Verse 1
  _getVerse1: ->
    # Setup sequence
    verse1 = new AnimationSequence()

    moment = new Frame.moment().getPatterns()
    verse1.addFrame(moment, defaultFrameDuration)

    thought = new Frame.thought().getPatterns()
    verse1.addFrame(thought, defaultFrameDuration)

    dream = new Frame.dream().getPatterns()
    verse1.addFrame(dream, defaultFrameDuration)

    wish = new Frame.wish().getPatterns()
    verse1.addFrame(wish, defaultFrameDuration)

    searchFrames = new Frame.search().getPatterns()
    for frame, i in searchFrames
      verse1.addFrame(frame, 4 * defaultFrameDuration / searchFrames.length)

    verse1

  # Verse 2
  _getVerse2: ->
    verse2 = new AnimationSequence()

    drink = new Frame.drink().getPatterns()
    verse2.addFrame(drink, defaultFrameDuration)

    text = new Frame.text().getPatterns()
    verse2.addFrame(text, defaultFrameDuration)

    laugh = new Frame.laugh().getPatterns()
    verse2.addFrame(laugh, defaultFrameDuration)

    flirt = new Frame.flirt().getPatterns()
    verse2.addFrame(flirt, defaultFrameDuration)

    kiss = new Frame.kiss().getPatterns()
    verse2.addFrame(kiss, defaultFrameDuration)

    lie = new Frame.lie().getPatterns()
    verse2.addFrame(lie, defaultFrameDuration)

    breakupFrames = new Frame.breakup().getPatterns()
    for frame, i in breakupFrames
      verse2.addFrame(frame, 4 * defaultFrameDuration / breakupFrames.length)

    verse2

  # Verse 3
  _getVerse3: ->
    verse3 = new AnimationSequence()
    # game = new Frame.game().getPatterns()
    # success = new Frame.success().getPatterns()
    # failure = new Frame.failure().getPatterns()
    # better = new Frame.better().getPatterns()
    # year = new Frame.year().getPatterns()
    # verse3
      # .addFrame(game, defaultFrameDuration)
      # .addFrame(success, defaultFrameDuration)
      # .addFrame(failure, defaultFrameDuration)
    #   .addFrame(better, defaultFrameDuration)
    #   .addFrame(year, defaultFrameDuration)
    verse3

module.exports = Animator