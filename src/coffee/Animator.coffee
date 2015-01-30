Frame = require './Frame'
AnimationSequence = require './AnimationSequence'

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
      .addFrame(moment, 1)
      .addFrame(thought, 1)
      .addFrame(dream, 1)
      .addFrame(wish, 1)
      .addFrame(search, 1)
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
      .addFrame(drink, 1)
      .addFrame(text, 1)
      .addFrame(laugh, 1)
      .addFrame(flirt, 1)
      .addFrame(kiss, 1)
      .addFrame(lie, 1)
      .addFrame(breakup, 1)
    verse2

  # Verse 3
  _getVerse3: ->
    verse3 = new AnimationSequence()
    game = new Frame.game().getPatterns()
    success = new Frame.success().getPatterns()
    failure = new Frame.failure().getPatterns()
    better = new Frame.better().getPatterns()
    year = new Frame.year().getPatterns()
    verse3
      .addFrame(game, 1)
      .addFrame(success, 1)
      .addFrame(failure, 1)
      .addFrame(better, 1)
      .addFrame(year, 1)
    verse3

module.exports = Animator