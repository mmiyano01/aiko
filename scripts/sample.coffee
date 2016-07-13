{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
 robot.hear /sample/i, (msg) ->
    @exec = require('child_process').exec
    #read user name from DB
    command = "sh scripts/shell/test.sh #{msg.message.user.name}"
    @exec command, (error, stdout) ->
      #delete space
      stdout = stdout.replace(/\s/g, "");
      msg.send error if error?
      msg.send stdout if stdout?
