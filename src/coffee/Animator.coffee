Frame = require './Frame'
AnimationSequence = require './AnimationSequence'

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
    # Get patterns
    moment = new Frame.moment().getPatterns()
    thought = new Frame.thought().getPatterns()
    dream = new Frame.dream().getPatterns()
    wish = new Frame.wish().getPatterns()
    search = new Frame.search().getPatterns()

    # Setup sequence
    verse1 = new AnimationSequence()
    verse1
      .addFrame(moment, defaultFrameDuration)
      .addFrame(thought, defaultFrameDuration)
      .addFrame(dream, defaultFrameDuration)
      .addFrame(wish, defaultFrameDuration)
      .addFrame(search, defaultFrameDuration)
    verse1

  # Verse 2
  _getVerse2: ->
    verse2 = new AnimationSequence()
    drink = new Frame.drink().getPatterns()
    text = new Frame.text().getPatterns()
    laugh = new Frame.laugh().getPatterns()
    flirt = new Frame.flirt().getPatterns()
    kiss = new Frame.kiss().getPatterns()
    lie = new Frame.lie().getPatterns()
    breakup = new Frame.breakup().getPatterns()
    verse2
      .addFrame(drink, defaultFrameDuration)
      .addFrame(text, defaultFrameDuration)
      .addFrame(laugh, defaultFrameDuration)
      .addFrame(flirt, defaultFrameDuration)
      .addFrame(kiss, defaultFrameDuration)
      .addFrame(lie, defaultFrameDuration)
      .addFrame(breakup, defaultFrameDuration)
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
    #   .addFrame(game, defaultFrameDuration)
    #   .addFrame(success, defaultFrameDuration)
    #   .addFrame(failure, defaultFrameDuration)
    #   .addFrame(better, defaultFrameDuration)
    #   .addFrame(year, defaultFrameDuration)
    verse3

module.exports = Animator