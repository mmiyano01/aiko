{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
 robot.respond /sample/, (msg) ->
    @exec = require('child_process').exec
    command = "sh /scripts/shell/test.sh"
    @exec command, (error, stdout) ->
      msg.send error if error?
      msg.send stdout if stdout?
