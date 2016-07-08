{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
  robot.hear /hello/i, (msg) ->
    msg.send "HI! " + msg.message.displayName
    msg.send msg.message.name
    msg.send msg.message.name.displayName
    msg.send msg.message.user.displayName
    msg.send msg.message.user.name
    msg.send msg.message.user_name
