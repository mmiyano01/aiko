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

     command_m = "sh scripts/shell/calc_expense/calc_expense.sh #{t_month} #{t_year} Masato Nina"
     @exec command_m, (error, stdout_m) ->
       array_m = stdout_m.match(/\D\d+\D/)
       ttl_m = 0
       for i in [0..array_m.length-1]
         ttl_m = array_m[i] + ttl_m
       msg.send error if error?
       msg.send "Masato: #{array_m}" if stdout_m?
       @exec = require('child_process').exec
    
       command_n = "sh scripts/shell/calc_expense/calc_expense.sh #{t_month} #{t_year} Nina Masato"
       @exec command_n, (error, stdout_n) ->
         array_n = stdout_n.split(/\D\d+\D/)
         ttl_n = 0
         for i in [0..array_n.length-1]
           ttl_n = array_n[i] + ttl_n
         msg.send error if error?
         msg.send "Nina: #{array_n}" if stdout_n?
         @exec = require('child_process').exec
