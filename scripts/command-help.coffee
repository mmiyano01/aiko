{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
  fs = require 'fs'
  _ = require 'underscore'

  robot.hear /command help/i, (msg) ->
    list = fs.readFileSync 'local/command_help.txt', 'utf8'
    msg.send list

