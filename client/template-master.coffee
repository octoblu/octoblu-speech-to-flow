_ = require 'lodash'

class TemplateMaster
  constructor: (credentials, dependencies={}) ->
    {@uuid, @token} = credentials
    @request = dependencies.request ? require 'superagent'
    @OCTOBLU_API = 'https://app.octoblu.com'

  findAndDeploy: (tags, callback=->) =>
    # Find By Tag
    @findOneByTags tags, (error, template) =>
      return callback error if error?
      return callback new Error('no template found') unless template?
      # Import Template
      @import template.uuid, (error, flow) =>
        return callback error if error?
        {flowId} = flow
        return callback new Error('no flow created') unless flowId?
        # Deploy the Flow
        @deploy flowId, callback

  findOneByTags: (tags, callback=->) =>
    tags =  _.map tags, (tag) =>
      if _.isString tag
        return _.trim tag.toLowerCase()
      else
        return tag
    @request
      .get "#{@OCTOBLU_API}/api/templates/public"
      .query tags: tags
      .auth @uuid, @token
      .end (error, result) =>
        return callback error if error?
        callback null, _.first(result?.body)

  import: (templateId, callback=->) =>
    @request
      .post "#{@OCTOBLU_API}/api/templates/#{templateId}/flows"
      .auth @uuid, @token
      .end (error, result) =>
        return callback error if error?
        callback null, result?.body

  deploy: (flowId, callback=->) =>
    @request
      .post "#{@OCTOBLU_API}/api/flows/#{flowId}/instance"
      .auth @uuid, @token
      .end (error) =>
        callback error

module.exports = TemplateMaster
