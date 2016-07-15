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
       ttl_m = stdout_m.replace(/\s/g, "");
       msg.send error if error?
       msg.send "Masato: #{ttl_m}" if stdout_m?
       #@exec = require('child_process').exec

       command_n = "sh scripts/shell/calc_expense/calc_expense.sh #{t_month} #{t_year} Nina Masato"
       @exec command_n, (error, stdout_n) ->
         ttl_n = stdout_n.replace(/\s/g, "");
         msg.send error if error?
         msg.send "Nina: #{array_n}" if stdout_n?
         #@exec = require('child_process').exec
         ttl_gap = ttl_n.to_i - ttl_m.to_i
         if ttl_gap > 0
           msg.send "Nina owes Masato #{ttl_gap}"
         else if ttl_gap < 0
           msg.send "Masato owes Nina #{ttl_gap * -1}"
         else if ttl_gap == 0
           msg.send "No money moevment"
         else
           msg.send "Something went wrong"
