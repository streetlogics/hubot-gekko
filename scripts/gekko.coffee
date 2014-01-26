# Description:
#   Event system related utilities
#
# Commands:
#   hubot fake event <event> - Triggers the <event> event for debugging reasons
#
# Events:
#   debug - {user: <user object to send message to>}

redis = require 'redis'
client = redis.createClient();

module.exports = (robot) ->

  robot.respond /gekko advice/i, (msg) ->

    msg.send "advice from Gekko:"

  robot.respond /gekko price/i, (msg) ->

    msg.send "price from Gekko:"