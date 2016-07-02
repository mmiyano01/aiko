{LineRawMessageListener, LineImageListener, LineVideoListener, LineAudioListener, LineLocationListener,
LineStickerListener, LineContactListener, LineRawOperationListener, LineFriendListener, LineBlockListener,
LineTextAction, LineImageAction, LineVideoAction, LineAudioAction, LineLocationAction, LineStickerAction
} = require 'hubot-line'

module.exports = (robot) ->
  fs = require 'fs'
  _ = require 'underscore'
  file = ""
  robot.hear /table topic (.*)/i, (msg) ->
    switch msg.match[1]
      when 'general'
        file = fs.readFileSync 'local/table-topic-general.txt', 'utf8'
        break  
    topics = file.split("\n").filter(Boolean)
    topic = msg.random topics
    msg.send topic
