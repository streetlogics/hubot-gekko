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
    msg.send "getting Gekko advice..."
    client.get "gekko:advice", (e, reply) ->
      msg.send "Current Gekko market recommendation for " + reply.market + " is " + reply.data.recommandation


  robot.respond /gekko price/i, (msg) ->
    msg.send "getting Gekko price..."
    client.get "gekko:advice", (e, reply) ->
      msg.send "Current Gekko market price for " + reply.market + " is " + reply.data.price