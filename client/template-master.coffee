_ = require 'lodash'
replaceAll = require 'replaceall'
DSLToFlow = require './dsl-to-flow'
FlowGenerator = require './flow-generator'
TriggerService = require './trigger-service'
nodeMeta = require './assets/node-meta'
ACTION_STARTERS = ['when']
BREAKERS = ['then', 'turn']
OBJECT_TYPE_MAP =
  lights: ['device:hue', 'device:lifx']
  light: ['device:hue', 'device:lifx']
  wemo: ['device:wemo']
  switch: ['device:wemo']
WITHOUT_WORDS = ['the', 'it', 'my']
SHORTENED_WORDS = {
  "i'm": "i am",
  "i’m": "i am",
  "it's": "it is",
  "it’s": "it is",
  "doesn't": "does not",
  "doesn’t": "does not",
  "isn't": "is not"
  "isn’t": "is not"
}

class TemplateMaster
  constructor: (credentials, dependencies={}) ->
    {@uuid, @token} = credentials
    @request = dependencies.request ? require 'superagent'
    @triggerService = new TriggerService credentials, dependencies

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

  createAndDeploy: (transcript, callback=->) =>
    # Find By Tag
    @createByTranscript transcript, (error, flow) =>
      return callback error if error?
      return callback new Error('unable to create flow') unless flow?
      {flowId} = flow
      return callback new Error('no flow created') unless flowId?
      # Deploy the Flow
      @deploy flowId, callback

  createByTranscript: (transcript, callback=->) =>
    @getFlowNodeTypes (error) =>
      return callback error if error?
      intent = @translate transcript
      return @tryAndFireTrigger(transcript) unless intent?
      console.log('intent', intent)
      dsl = @createDSL intent
      @createFromDSL transcript, dsl, callback

  tryAndFireTrigger: (transcript) =>
    console.log('attempting to fire trigger', transcript)
    @triggerService.fire @simplifyTranscript(transcript)

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

  simplifyTranscript: (transcript) =>
    transcript = transcript.toLowerCase()
    _.each _.keys(SHORTENED_WORDS), (key) =>
      transcript = replaceAll key, SHORTENED_WORDS[key], transcript
    transcript

  translate: (transcript) =>
    transcript = @simplifyTranscript transcript
    words = transcript.split(' ')
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
    words = _.takeRight words, (words.length - 1) - index
    _.each WITHOUT_WORDS, (word) =>
      words = _.without words, word
    action = _.last words
    words = _.without words, action
    object = words?.join(' ')
    nodeType = @findNodeTypeByObject(object)
    type = nodeType.type if nodeType?
    return unless keyphrase? && action? && type?
    {
      keyphrase: keyphrase
      action: action
      type: type
    }

  findNodeTypeByObject: (object='') =>
    object = object.toLowerCase()
    nodeType = _.find @nodeTypes, (nodeType) =>
      return false unless nodeType?.name?
      name = nodeType.name.toLowerCase()
      return true if name == object
      pieces = nodeType.type.split(':')
      type = pieces[1].toLowerCase() if pieces[1]?
      return true if type == object
      return false
    return nodeType if nodeType?

    objectTypes = OBJECT_TYPE_MAP[object]
    return null unless objectTypes?
    nodeType = _.find @nodeTypes, (nodeType) =>
      _.includes objectTypes, nodeType.type
    return nodeType if nodeType?
    return null

  createDSL: (intent) =>
    return unless intent.action? || intent.type?
    flowGenerator = new FlowGenerator @nodeTypes
    triggerMeta = @getMetaData('operation:trigger', 'timestamp')
    triggerMeta.name = intent.keyphrase?.toLowerCase()
    flowGenerator.addNode triggerMeta
    flowGenerator.addNode @getMetaData(intent.type, intent.action)
    flowGenerator.addNode @getMetaData('operation:debug', 'timestamp')
    flowGenerator.linkNodes 0, 1
    flowGenerator.linkNodes 1, 2
    flowGenerator.flow

  getMetaData: (type, action) =>
    defaultNodeMeta = nodeMeta[type]?[action] || {}
    _.defaults(type: type, defaultNodeMeta)

  createFromDSL: (transcript, dsl, callback=->) =>
    dslToFlow = new DSLToFlow nodeTypes: @nodeTypes
    flow = dslToFlow.convertToFlow dsl
    flow.name = transcript
    @createFlow flow, (error, newFlow) =>
      return callback error if error?
      callback null, newFlow

  createTemplate: (template, callback=->) =>
    @request
      .post "#{@OCTOBLU_API}/api/templates/raw"
      .auth @uuid, @token
      .send template
      .end (error, result) =>
        callback error, result?.body

  createFlow: (flow, callback=->) =>
    @request
      .post "#{@OCTOBLU_API}/api/flows"
      .auth @uuid, @token
      .send flow
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
