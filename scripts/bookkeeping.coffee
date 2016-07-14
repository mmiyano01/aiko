{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
 robot.hear /add expense (.*) (.*) (.*)/i, (msg) ->
    @exec = require('child_process').exec
    command = "sh scripts/shell/auth.sh #{msg.message.user.name}"
    @exec command, (error, stdout) ->
      reporter = stdout.replace(/\s/g, "");
      msg.send "auth failed. try again" if error?
      msg.send "ok, #{reporter}" if stdout?
      @exec = require('child_process').exec
      command = "sh scripts/shell/add_expense.sh #{reporter} #{msg.match[1]} #{msg.match[2]} #{msg.match[3]}"
      @exec command, (error, stdout) ->
        msg.send error if error?
        msg.send "expense record added! ...ouch!" if stdout?

 robot.hear /show expense/i, (msg) ->
   @exec = require('child_process').exec
   command = "sh scripts/shell/auth.sh #{msg.message.user.name}"
   @exec command, (error, stdout) ->
     reporter = stdout.replace(/\s/g, "");
     msg.send "auth failed. try again" if error?
     msg.send "ok, #{reporter}" if stdout?
     @exec = require('child_process').exec
     command = "sh scripts/shell/show_expense.sh"
     @exec command, (error, stdout) ->
      msg.send error if error?
      msg.send stdout if stdout?
