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
    return []

  # Verse 2
  _getVerse2: ->
    return []

  # Verse 3
  _getVerse3: ->
    return []

module.exports = Animator