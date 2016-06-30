{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

cron = require('cron').CronJob
_ = require 'underscore'

module.exports = (robot) ->
  job = new cron '55 12 * * 1-5', ->
    robot.send "昼から本気出す!"

  job.start()
