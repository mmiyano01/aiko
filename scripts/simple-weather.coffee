{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
  robot.hear /(.*)\'s weather/i, (msg) ->
    switch msg.match[1]
      when 'today'
        day = 0
      when 'tomorrow'
        day = 1
      when 'day after tomorrow'
        day = 2
      else
        day = 3
        break
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=270000')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == 3 then forecast = 'don\'t know' else forecast = json['forecasts'][day]['telop']
      msg.send forecast
