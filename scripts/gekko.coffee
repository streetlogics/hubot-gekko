# Description:
#   Simple script to tie into Gekko Redis beacon.
#
# Commands:
#   hubot gekko advice - Gets gekko advice
#   hubot gekko price  - Gets gekko price
#   hubot gekko trade  - Gets gekko last trade
#

redis = require 'redis'
client = redis.createClient()
module.exports = (robot) ->

  robot.respond /gekko advice/i, (msg) ->
    msg.send "getting Gekko advice..."
    client.get "gekko:advice", (e, reply) ->
      reply = JSON.parse(reply)
      msg.send "Current Gekko market recommendation for #{reply.market} is #{reply.data.recommandation}"

  robot.respond /gekko price/i, (msg) ->
    msg.send "getting Gekko price..."
    client.get "gekko:candle", (e, reply) ->
      reply = JSON.parse(reply)
      msg.send "Current Gekko market price for #{reply.market} is #{reply.data.c}"

  robot.respond /gekko trade/i, (msg) ->
    msg.send "getting Gekko last trade..."
    client.get "gekko:trade", (e, reply) ->
      reply = JSON.parse(reply)
      msg.send "Current Gekko market price for #{reply.market} is #{reply.data.price}"