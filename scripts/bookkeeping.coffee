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

 robot.hear /show expense (.*) (.*)/i, (msg) ->
   @exec = require('child_process').exec
   command = "sh scripts/shell/auth.sh #{msg.message.user.name}"
   @exec command, (error, stdout) ->
     reporter = stdout.replace(/\s/g, "");
     msg.send "auth failed. try again" if error?
     msg.send "ok, #{reporter}" if stdout?
     @exec = require('child_process').exec
     t_month = msg.match[1]
     t_year = msg.match[2]
     d = new Date
     year = d.getFullYear()

     command_m = "sh scripts/shell/show_expense.sh #{t_month} #{t_year} Masato"
     @exec command_m, (error, stdout) ->
       ttl_m = stdout.replace(/\s/g, "");
       msg.send error if error?
       msg.send "Masato: #{ttl_m}" if stdout?
       @exec = require('child_process').exec
    
       command_n = "sh scripts/shell/show_expense.sh #{t_month} #{t_year} Nina"
       @exec command_n, (error, stdout) ->
         ttl_n = stdout.replace(/\s/g, "");
         msg.send error if error?
         msg.send "Nina: #{ttl_n}" if stdout?
         @exec = require('child_process').exec
         
         command_e = "sh scripts/shell/show_expense.sh #{t_month} #{t_year} even"
         @exec command_e, (error, stdout) ->
           ttl_e = stdout.replace(/\s/g, "");
           msg.send error if error?
           msg.send "Even: #{ttl_e}" if stdout?
