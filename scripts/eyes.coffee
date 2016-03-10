# Description:
#   Autogen messages about pull requests.
#
# Dependencies:
#   None
#
# Commands:
#  :eyes: {{ repo }} #{{ PR_NUMBER }}
#
# Author:
#   github.com/threesided

module.exports = (robot) ->
  robot.hear /\:eyes\:\stsf\-(frontend|api)\s?\#?([1-9\s]{1,})/i, (msg) ->

    sendMessage = (PR_ID) ->
      "https://github.com/thestorefront/tsf-#{ msg.match[0] }/pull/#{ PR_ID } \n"

    robot.respond "@here :eyes:\n" + (sendMessage for PR in msg.match[1].trim().split ' ').join '\n'
