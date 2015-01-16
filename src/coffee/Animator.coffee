Frame = require './Frame'

# A magician with a dream
Animator =
  # Gets all the frames needed
  getAnimation: ->
    frames = @_getVerse1.concat @_getVerse2(), @_getVerse3

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
    # ## Verse 3
    #
    # A game
    # A win
    # A loss
    # A success
    # A failure
    # A try
    # To do better

    frames

  # Verse 1
  _getVerse1: ->
    moment = new Frame.moment().getPatterns()
    thought = new Frame.thought().getPatterns()
    dream = new Frame.dream().getPatterns()
    wish = new Frame.wish().getPatterns()
    search = new Frame.search().getPatterns()
    return []

  # Verse 2
  _getVerse2: ->
    drink = new Frame.drink().getPatterns()
    text = new Frame.text().getPatterns()
    laugh = new Frame.laugh().getPatterns()
    flirt = new Frame.flirt().getPatterns()
    kiss = new Frame.kiss().getPatterns()
    lie = new Frame.lie().getPatterns()
    breakup = new Frame.breakup().getPatterns()
    return []

  # Verse 3
  _getVerse3: ->
    game = new Frame.game().getPatterns()
    success = new Frame.success().getPatterns()
    failure = new Frame.failure().getPatterns()
    better = new Frame.better().getPatterns()
    year = new Frame.year().getPatterns()
    return []

module.exports = Animator