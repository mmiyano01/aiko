{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
  robot.hear /hello/i, (msg) ->
    msg.send "HI! " + msg.message.displayName + msg.message.name + msg.message.name.displayName + msg.message.user.displayName + msg.message.user.name + msg.message.user_name
