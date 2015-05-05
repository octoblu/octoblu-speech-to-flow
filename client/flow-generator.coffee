_ = require 'lodash'

class FlowGenerator
  constructor: ->
    @flow = {}
    @flow.nodes = []
    @flow.links = []

  addNode: (nodeMeta = {}) =>
    @flow.nodes.push nodeMeta if nodeMeta.type?

  linkNodes: (fromNodeIndex, toNodeIndex) =>
    nodeSize = @flow.nodes.length

    return unless _.inRange(fromNodeIndex, nodeSize) && _.inRange(toNodeIndex, nodeSize)
    @flow.links.push from: fromNodeIndex, to: toNodeIndex

  toJSON: =>
    JSON.stringify @flow

module.exports = FlowGenerator
