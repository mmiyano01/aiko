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

     command = "sh scripts/shell/show_expense.sh #{t_month} #{t_year} Masato"
     @exec command, (error, stdout) ->
       ttl_m = stdout.replace(/\s/g, "");
       @exec = require('child_process').exec

       msg.send error if error?
       msg.send "Masato: #{ttl_m}" if stdout?
    
       command = "sh scripts/shell/show_expense.sh #{t_month} #{t_year} Nina"
       @exec command, (error, stdout) ->
         ttl_n = stdout.replace(/\s/g, "");
         @exec = require('child_process').exec

         msg.send error if error?
         msg.send "Nina: #{ttl_n}" if stdout?

         command = "sh scripts/shell/show_expense.sh #{t_month} #{t_year} even"
         @exec command, (error, stdout) ->
           ttl_e = stdout.replace(/\s/g, "");
           @exec = require('child_process').exec

           msg.send error if error?
           msg.send "Even: #{ttl_e}" if stdout?
