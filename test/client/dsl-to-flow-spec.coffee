DSLToFlow = require '../../client/dsl-to-flow'
bareBonesFlow = require '../../client/assets/bare-bones-flow'
imHomeDSL = require '../../client/assets/im-home-dsl'
imHomeFlow = require '../../client/assets/im-home-flow'
nodeTypes = require '../../client/assets/node-types'

describe 'DSLToFlow', ->
  beforeEach ->
    @uuid =
      v1: sinon.stub().returns '1234'

    @sut = new DSLToFlow {nodeTypes: nodeTypes}, {uuid: @uuid}

  describe '->convertToFlow', ->
    describe 'when called with nothing', ->
      beforeEach ->
        @result = @sut.convertToFlow()

      it 'should return an empty flow', ->
        expect(@result).to.deep.equal bareBonesFlow

    describe 'when called with the im-home.dsl', ->
      beforeEach ->
        @result = @sut.convertToFlow(imHomeDSL)

      it 'should return a I\'m Home flow', ->
        expect(@result).to.deep.equal imHomeFlow

  describe '->convertNode', ->
    describe 'when called with a trigger dsl', ->
      beforeEach ->
        @result = @sut.convertNode type: "operation:trigger"

      it 'should return an actual trigger', ->
        triggerNode =
          id: "1234",
          type: "operation:trigger"
          uuid: "37f0a74a-2f17-11e4-9617-a6c5e4d22fb7"
          name: "Trigger"
          category: "operation"
          inputLocations: [
            27.5
          ]
          outputLocations: [
            27.5
          ]
          output: 1
          input: 0
          defaults:
            category: "operation"
            name: "Trigger"
            type: "operation:trigger"

        expect(@result).to.deep.equal triggerNode

    describe 'when called with a interval dsl', ->
      beforeEach ->
        intervalDSL =
          type: 'operation:interval'
          repeat: 1000
          on: true

        @result = @sut.convertNode intervalDSL

      it 'should return an actual interval', ->
        intervalNode =
          id: "1234",
          type: "operation:interval"
          on: true
          repeat: 1000
          uuid: "37f0a966-2f17-11e4-9617-a6c5e4d22fb7"
          name: "Interval"
          category: "operation"
          inputLocations: [
            27.5
          ]
          outputLocations: [
            27.5
          ]
          output: 1
          input: 1
          defaults:
            category: "operation"
            name: "Interval"
            type: "operation:interval"

        expect(@result).to.deep.equal intervalNode

      describe 'when called with a wemo dsl', ->
        beforeEach ->
          hueDSL =
            type: "device:wemo",
            staticMessage:
              on: true,
              color: "white"

          @result = @sut.convertNode hueDSL

        it 'should return an actual wemo', ->
          hueNode =
            id: "1234",
            type: "device:wemo",
            uuid: "2836e14d-ef41-40b3-8861-24ae5464da97"
            name: "Office Light"
            category: "device"
            staticMessage:
              on: true,
              color: "white"
            inputLocations: [
              27.5
            ]
            outputLocations: [
              27.5
            ]
            output: 1
            input: 1
            defaults:
              category: "device"
              name: "Office Light"
              type: "device:wemo"

          expect(@result).to.deep.equal hueNode

  describe '->convertLinks', ->
    describe 'when called with a basic links', ->
      beforeEach ->
        links = [
          { to: 0, from: 1 }
          { to: 1, from: 0 }
        ]
        nodes = [
          { id: '1234' }
          { id: '4321' }
        ]
        @result = @sut.convertLinks links, nodes

      it 'should return the flow structor', ->
        links = [
          { to: '1234', toPort: 0, from: '4321', fromPort: 0 }
          { to: '4321', toPort: 0, from: '1234', fromPort: 0 }
        ]
        expect(@result).to.deep.equal links
