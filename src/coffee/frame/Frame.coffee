# The base class for each animation frame set
class Frame
  # Gets the pattern array from the frame
  getPatterns: ->
    throw new Error 'getPatterns not implemented'

module.exports = Frame
module.exports.DEFAULT_WIDTH = 15
module.exports.DEFAULT_HEIGHT = 9
