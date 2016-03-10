# Description:
#   Autogen messages about pull requests.
#
# Dependencies:
#   None
#
# Commands:
#  :eyes: {{ repo }} #{{ PR_NUMBERS }}
#
# Author:
#   github.com/threesided

module.exports = (robot) ->
  robot.hear /\:eyes\:\stsf\-(frontend|api|dotcom|search|dashboard)\s?\#?([1-9\s]{1,})\s?/i, (msg) ->

    sendMessage = (repo, prId) ->
      "https://github.com/thestorefront/tsf-#{ repo }/pull/#{ prId }"

    pullRequests = msg.match[2].trim().split ' '

    msg.send "@here :eyes:\n" + (sendMessage(msg.match[1], id) for id in pullRequests).join('\n')
