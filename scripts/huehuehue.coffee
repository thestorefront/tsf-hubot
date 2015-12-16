# Description:
#   When I type "hehehe" or "huehuehue", show me the lizard.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_DASHBOARD_URL
#   HUBOT_DASHBOARD_TOKEN
#
# Commands:
#   hehehehehehehe - show me the lizard
#
# Author:
#   github.com/threesided

module.exports = (robot) ->
  robot.hear /(he|hue){3,}.*/i, (msg) ->
    msg.reply "http://media2.giphy.com/media/9MFsKQ8A6HCN2/giphy.gif"
