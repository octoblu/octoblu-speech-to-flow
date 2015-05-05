_ = require 'lodash'
DSLToFlow = require './dsl-to-flow'
FlowGenerator = require './flow-generator'
nodeMeta = require './assets/node-meta'
ACTION_STARTERS = ['when']
BREAKERS = ['then', 'turn']
OBJECT_TYPE_MAP =
  lights: ['device:hue', 'device:lifx']
  wemo: ['device:wemo']
WITHOUT_WORDS = ['the', 'it', 'my']

class TemplateMaster
  constructor: (credentials, dependencies={}) ->
    {@uuid, @token} = credentials
    @request = dependencies.request ? require 'superagent'

    @OCTOBLU_API = 'https://app.octoblu.com'
    @MESHBLU_API = 'https://meshblu.octoblu.com'

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

  findOrCreateAndDeploy: (transcript, callback=->) =>
    # Find By Tag
    @findOneByTags [transcript], (error, template) =>
      return callback error if error?
      @createTemplateMaybe transcript, template, (error, template) =>
        @import template.uuid, (error, flow) =>
          return callback error if error?
          {flowId} = flow
          return callback new Error('no flow created') unless flowId?
          # Deploy the Flow
          @deploy flowId, callback

  createTemplateMaybe: (transcript, template, callback=->) =>
    return callback null, template if template?
    @getFlowNodeTypes (error) =>
      return callback error if error?
      intent = @translate transcript
      dsl = @createDSL intent
      @createFromDSL transcript, dsl, callback

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

  translate: (transcript) =>
    words = transcript.split(' ')
    _.each WITHOUT_WORDS, (word) =>
      words = _.without words, word
    firstWord = _.first words
    return unless _.includes ACTION_STARTERS, firstWord
    actionStarter = firstWord
    words = _.without words, actionStarter
    index = -1
    _.each BREAKERS, (breaker) =>
      index = _.indexOf words, breaker
      words = _.without words, breaker
      index--
    return if index == -1
    keyphrase = _.take(words, index + 1)?.join(' ')
    words = _.takeRight words, index
    object = _.first words
    nodeType = @findNodeTypeByObject(object)
    type = nodeType.type if nodeType?
    action = _.last words
    {
      keyphrase: keyphrase
      action: action
      type: type
    }

  findNodeTypeByObject: (object='') =>
    object = object.toLowerCase()
    objectTypes = OBJECT_TYPE_MAP[object]
    if objectTypes?
      nodeType = _.find @nodeTypes, (nodeType) =>
        return _.includes objectTypes, nodeType.type
      return nodeType if nodeType?

    return _.find @nodeTypes, (nodeType) =>
      return false unless nodeType?
      pieces = nodeType.type.split(':')
      type = pieces[1].toLowerCase() if pieces[1]?
      return true if type == object
      type = nodeType.name.toLowerCase() if pieces[1]?
      return true if type == object
      return false

  createDSL: (intent) =>
    return unless intent.action? || intent.type?
    flowGenerator = new FlowGenerator @nodeTypes
    defaultNodeMeta = nodeMeta[intent.type]?[intent.action] || {}
    nodeMeta = _.defaults(type: intent.type, defaultNodeMeta)
    flowGenerator.addNode type: 'operation:trigger'
    flowGenerator.addNode nodeMeta
    flowGenerator.addNode type: 'operation:debug'
    flowGenerator.linkNodes 0, 1
    flowGenerator.linkNodes 1, 2
    flowGenerator.flow

  createFromDSL: (transcript, dsl, callback=->) =>
    dslToFlow = new DSLToFlow nodeTypes: @nodeTypes
    template = dslToFlow.convertToFlow dsl
    @createTemplate name: transcript, flow: template, (error, template) =>
      return callback error if error?
      callback null, template

  createTemplate: (template, callback=->) =>
    @request
      .post "#{@OCTOBLU_API}/api/templates/raw"
      .auth @uuid, @token
      .send template
      .end (error, result) =>
        callback error, result?.body

  getFlowNodeTypes: (callback=->) =>
    @request
      .get "#{@OCTOBLU_API}/api/flow_node_types"
      .auth @uuid, @token
      .end (error, result) =>
        return callback error if error?
        @nodeTypes = result?.body || []
        callback null

module.exports = TemplateMaster
