# Description:
#   Set the On Point Engineer on the TSF Dashboard.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_DASHBOARD_URL
#   HUBOT_DASHBOARD_TOKEN
#
# Commands:
#   hubot <name> is on point - set the on point engineer
#
# Author:
#   github.com/TrevorS

dashboardURL   = process.env.HUBOT_DASHBOARD_URL
dashboardToken = process.env.HUBOT_DASHBOARD_TOKEN

module.exports = (robot) ->
  robot.respond /(\w*) is on point/i, (msg) ->
    setEngineer(msg, capitalize(msg.match[1]))

  setEngineer = (msg, name) ->
    robot.http(dashboardURL + '/dashing/widgets/onpoint')
      .query('widget[current]': name, 'auth_token': dashboardToken)
      .put() (err, res, body) ->
        if err
          msg.send "Could not set On Point Engineer: #{err}."
        else
          msg.send "#{name} is now the On Point Engineer."

  capitalize = (name) ->
    name.charAt(0).toUpperCase() + name.slice(1)
