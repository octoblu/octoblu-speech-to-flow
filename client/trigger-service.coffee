_ = require 'lodash'

class TriggerService
  constructor: (credentials, dependencies={}) ->
    {@uuid, @token} = credentials
    @request = dependencies.request ? require 'superagent'
    @TRIGGER_API = 'https://triggers.octoblu.com'

  fire: (keyphrase) =>
    return console.log('no keyphrase') unless keyphrase?
    keyphrase = keyphrase.toLowerCase()
    @getTriggers (error, triggers) =>
      return console.error error if error?
      triggers = _.filter(triggers, name: keyphrase)
      _.each triggers, @fireTrigger

  fireTrigger: (trigger) =>
    @request
      .post trigger.uri
      .auth @uuid, @token
      .end (error, result) =>
        return console.error error if error?
        console.log trigger.name + ' triggered'

  getTriggers: (callback=->) =>
    @request
      .get "#{@TRIGGER_API}/triggers"
      .auth @uuid, @token
      .end (error, result) =>
        return callback error if error?
        callback null, result?.body

module.exports = TriggerService
