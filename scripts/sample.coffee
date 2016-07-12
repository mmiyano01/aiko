{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
 robot.hear /sample/i, (msg) ->
    @exec = require('child_process').exec
    command = "sh scripts/shell/test.sh uacc170cb363a84aa4bb0e227bec7b351"
    @exec command, (error, stdout) ->
      msg.send error if error?
      msg.send stdout if stdout?
