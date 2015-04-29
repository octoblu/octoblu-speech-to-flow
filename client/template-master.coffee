class TemplateMaster
  constructor: (credentials, dependencies={}) ->
    {@uuid, @token} = credentials
    @request = dependencies.request ? require 'superagent'
    @OCTOBLU_API = 'https://app.octoblu.com'

  findByTag: (tag, callback=->) =>
    @request
      .get "#{@OCTOBLU_API}/api/templates/public"
      .query tags: [tag]
      .auth @uuid, @token
      .end (error, result) =>
        return callback error if error?
        callback null, result?.body

  import: (templateId, callback=->) =>
    @request
      .post "#{@OCTOBLU_API}/api/templates/#{templateId}/flows"
      .auth @uuid, @token
      .end (error, result) =>
        return callback error if error?
        callback null, result?.body

  deployFlow: (flowId, callback=->) =>
    @request
      .post "#{@OCTOBLU_API}/api/flows/#{flowId}/instance"
      .auth @uuid, @token
      .end (error) =>
        callback error

module.exports = TemplateMaster
