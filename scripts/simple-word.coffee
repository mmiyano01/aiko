{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
  robot.hear /hello1/i, (msg) ->
    msg.send "HI! " + msg.displayName
  robot.hear /hello2/i, (msg) ->
    msg.send "HI! " + msg.message.displayName
  robot.hear /hello3/i, (msg) ->
    msg.send "HI! " + msg.message.user.username
  robot.hear /hello4/i, (msg) ->
    msg.send "HI! " + msg.message.user.user_name
  robot.hear /hello5/i, (msg) ->
    msg.send "HI! " + msg.message.user.name

