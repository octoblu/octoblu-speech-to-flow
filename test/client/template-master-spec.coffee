TemplateMaster = require '../../client/template-master'
nodeTypes = require '../../client/assets/node-types'

describe 'TemplateMaster', ->
  beforeEach ->
    @request = {}
    @request.get = sinon.stub().returns @request
    @request.query = sinon.stub().returns @request
    @request.post = sinon.stub().returns @request
    @request.send = sinon.stub().returns @request
    @request.auth = sinon.stub().returns @request

    @dependencies = request: @request

  describe '->findOneByTags', ->
    describe 'when instantiated with a uuid and token', ->
      beforeEach ->
        credentials = uuid: 'black', token: 'green'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a tag', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: [{name: 'cold-brew'}]
          @sut.findOneByTags ['mocha'], (error, @templates) => done()

        it 'should set the auth for the request', ->
          expect(@request.auth).to.have.been.calledWith 'black','green'

        it 'should call request with the correct uri and data', ->
          expect(@request.get).to.have.been.calledWith 'https://app.octoblu.com/api/templates/public'

        it 'should call request with the correct uri and data', ->
          expect(@request.query).to.have.been.calledWith tags: ['mocha']

        it 'should call the callback with templates', ->
          expect(@templates).to.deep.equal {name: 'cold-brew'}

    describe 'when instantiated with a different uuid and token', ->
      beforeEach ->
        credentials = uuid: 'iced', token: 'herbal'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a tag', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: [{name: 'espresso'}]
          @sut.findOneByTags 'mocha', (error, @templates) => done()

        it 'should set the auth for the request', ->
          expect(@request.auth).to.have.been.calledWith 'iced','herbal'

      describe 'when called with a different tag', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: [{name: 'chai'}, {name: 'tea'}]
          @sut.findOneByTags ['clever'], (error, @templates) => done()

        it 'should call request with the correct uri and data', ->
          expect(@request.get).to.have.been.calledWith 'https://app.octoblu.com/api/templates/public'

        it 'should call request with the correct uri and data', ->
          expect(@request.query).to.have.been.calledWith tags: ['clever']

        it 'should call the callback with templates', ->
          expect(@templates).to.deep.equal {name: 'chai'}

      describe 'when called with a different tag and it yields an error', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields new Error('oh no')
          @sut.findOneByTags ['latte'], (@error) => done()

        it 'should yield an error', ->
          expect(@error.message).to.equal 'oh no'

  describe '->import', ->
    describe 'when instantiated with credentials', ->
      beforeEach ->
        credentials = uuid: 'oolong', token: 'featured'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a templateId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: flowId: 'daily-coffee'
          @sut.import 'sweet', (error, @flow) => done()

        it 'should set the uuid and token as the request.auth', ->
          expect(@request.auth).to.have.been.calledWith 'oolong', 'featured'

        it 'should call request.post', ->
          expect(@request.post).to.have.been.calledWith 'https://app.octoblu.com/api/templates/sweet/flows'

        it 'should yield a flow', ->
          expect(@flow).to.deep.equal flowId: 'daily-coffee'

      describe 'when called with a different templateId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: flowId: 'weekly-coffee'
          @sut.import 'sweet-number-two', (error, @flow) => done()

        it 'should yield a flow', ->
          expect(@flow).to.deep.equal flowId: 'weekly-coffee'

      describe 'when called with an invalid templateId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields new Error('it did not work')
          @sut.import 'chemex', (@error) => done()

        it 'should call the callback with the error', ->
          expect(@error.message).to.deep.equal 'it did not work'

    describe 'when instantiated with different credentials', ->
      beforeEach ->
        credentials = uuid: 'herio', token: 'v60'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a templateId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: flowId: 'daily-coffee'
          @sut.import 'sweet', (error, @flow) => done()

        it 'should set the uuid and token as the request.auth', ->
          expect(@request.auth).to.have.been.calledWith 'herio', 'v60'

  describe '->deploy', ->
    describe 'when instantiated with credentials', ->
      beforeEach ->
        credentials = uuid: 'excellente', token: 'one&one'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a flowId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields()
          @sut.deploy 'aeropress', (@error) => done()

        it 'should call request.auth with the uuid and token', ->
          expect(@request.auth).to.have.been.calledWith 'excellente', 'one&one'

        it 'should call request.post', ->
          expect(@request.post).to.have.been.calledWith 'https://app.octoblu.com/api/flows/aeropress/instance'

        it 'should not throw an error', ->
          expect(@error).to.not.exist

    describe 'when instantiated with different credentials', ->
      beforeEach ->
        credentials = uuid: 'toddy', token: 'stupid-things'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a flowId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields()
          @sut.deploy 'aeropress', (@error) => done()

        it 'should call request.auth with the uuid and token', ->
          expect(@request.auth).to.have.been.calledWith 'toddy', 'stupid-things'

      describe 'when called with an invalid flowId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields new Error('oh boy')
          @sut.deploy 'latte', (@error) => done()

        it 'should throw an error', ->
          expect(@error.message).to.equal 'oh boy'

  describe '->getFlowNodeTypes', ->
    describe 'when instantiated with credentials', ->
      beforeEach ->
        credentials = uuid: 'oolong', token: 'featured'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: [name: 'awesome']
          @sut.getFlowNodeTypes => done()

        it 'should set the uuid and token as the request.auth', ->
          expect(@request.auth).to.have.been.calledWith 'oolong', 'featured'

        it 'should call request.get', ->
          expect(@request.get).to.have.been.calledWith 'https://app.octoblu.com/api/flow_node_types'

        it 'should yield a flow', ->
          expect(@sut.nodeTypes).to.deep.equal [name: 'awesome']

      describe 'when called and it yields an error', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields new Error('it did not work')
          @sut.getFlowNodeTypes (@error) => done()

        it 'should call the callback with the error', ->
          expect(@error.message).to.deep.equal 'it did not work'

    describe 'when instantiated with different credentials', ->
      beforeEach ->
        credentials = uuid: 'herio', token: 'v60'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: []
          @sut.getFlowNodeTypes => done()

        it 'should set the uuid and token as the request.auth', ->
          expect(@request.auth).to.have.been.calledWith 'herio', 'v60'

  describe '->createTemplate', ->
    describe 'when instantiated with credentials', ->
      beforeEach ->
        credentials = uuid: 'oolong', token: 'featured'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a template', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: uuid: 1, flow: { name: 'sweet' }
          @sut.createTemplate flow: { name: 'sweet' }, (error, @template) => done()

        it 'should set the uuid and token as the request.auth', ->
          expect(@request.auth).to.have.been.calledWith 'oolong', 'featured'

        it 'should call request.post', ->
          expect(@request.post).to.have.been.calledWith 'https://app.octoblu.com/api/templates/raw'

        it 'should call request.send', ->
          expect(@request.send).to.have.been.calledWith flow: { name: 'sweet' }

        it 'should yield a flow', ->
          expect(@template).to.deep.equal uuid: 1, flow: { name: 'sweet' }

      describe 'when called and it yields an error', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields new Error('it did not work')
          @sut.createTemplate bacon:  { name: 'sweet' }, (@error) => done()

        it 'should call the callback with the error', ->
          expect(@error.message).to.deep.equal 'it did not work'

    describe 'when instantiated with different credentials', ->
      beforeEach ->
        credentials = uuid: 'herio', token: 'v60'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: []
          @sut.createTemplate {}, => done()

        it 'should set the uuid and token as the request.auth', ->
          expect(@request.auth).to.have.been.calledWith 'herio', 'v60'

  describe '->translate', ->
    beforeEach ->
      credentials = uuid: 'oolong', token: 'featured'

      @sut = new TemplateMaster credentials, @dependencies
      @sut.nodeTypes = nodeTypes

    describe 'when called without when', ->
      beforeEach ->
        @result = @sut.translate 'I am home'

      it 'should return nothing', ->
        expect(@result).to.not.exist

    describe 'when called with a light on transcript', ->
      beforeEach ->
        @result = @sut.translate 'when I am home turn the lights on'

      it 'should return translated object', ->
        translated =
          keyphrase: "i am home"
          type: 'device:hue'
          action: 'on'
        expect(@result).to.deep.equal translated

    describe 'when called with a wemo on transcript', ->
      beforeEach ->
        @result = @sut.translate 'when I am home turn the wemo on'

      it 'should return translated object', ->
        translated =
          keyphrase: "i am home"
          type: 'device:wemo'
          action: 'on'
        expect(@result).to.deep.equal translated

    describe 'when called with a light off transcript', ->
      beforeEach ->
        @result = @sut.translate 'when I am leaving then turn the lights off'

      it 'should return translated object', ->
        translated =
          keyphrase: "i am leaving"
          type: 'device:hue'
          action: 'off'
        expect(@result).to.deep.equal translated

    describe 'when called with a wemo off transcript', ->
      beforeEach ->
        @result = @sut.translate 'when I am leaving then turn the wemo off'

      it 'should return translated object', ->
        translated =
          keyphrase: "i am leaving"
          type: 'device:wemo'
          action: 'off'
        expect(@result).to.deep.equal translated

    describe 'when called with a device name on transcript', ->
      beforeEach ->
        @result = @sut.translate 'when I am awesome turn the office light on'

      it 'should return translated object', ->
        translated =
          keyphrase: "i am awesome"
          type: 'device:wemo'
          action: 'on'
        expect(@result).to.deep.equal translated

    describe 'when called with a device name off transcript', ->
      beforeEach ->
        @result = @sut.translate 'when I am awesome turn the office light on'

      it 'should return translated object', ->
        translated =
          keyphrase: "i am awesome"
          type: 'device:wemo'
          action: 'on'
        expect(@result).to.deep.equal translated

    describe 'when called with shortened words transcript', ->
      beforeEach ->
        @result = @sut.translate "when i'm awesome turn the office light on"

      it 'should return translated object', ->
        translated =
          keyphrase: "i am awesome"
          type: 'device:wemo'
          action: 'on'
        expect(@result).to.deep.equal translated

    describe 'when called with "when I am in the office then turn the lights off" transcript', ->
      beforeEach ->
        @result = @sut.translate "when I am in the office then turn the lights off"

      it 'should return translated object', ->
        translated =
          keyphrase: "i am in the office"
          type: 'device:hue'
          action: 'off'
        expect(@result).to.deep.equal translated

    describe 'when called with "when I’m home turn the lights on" transcript', ->
      beforeEach ->
        @result = @sut.translate "when I’m home turn the lights on"

      it 'should return translated object', ->
        translated =
          keyphrase: "i am home"
          type: 'device:hue'
          action: 'on'
        expect(@result).to.deep.equal translated

    describe 'when called with "when I am in the office then turn the lights off" transcript', ->
      beforeEach ->
        @result = @sut.translate "when I am in the office then turn the lights off"

      it 'should return translated object', ->
        translated =
          keyphrase: "i am in the office"
          type: 'device:hue'
          action: 'off'
        expect(@result).to.deep.equal translated

    describe 'when called with "when I am office then turn the lights off" transcript', ->
      beforeEach ->
        @result = @sut.translate "when I am office then turn the lights off"

      it 'should return translated object', ->
        translated =
          keyphrase: "i am office"
          type: 'device:hue'
          action: 'off'
        expect(@result).to.deep.equal translated
    describe 'when called with "when I am home turn the lights on" transcript', ->
      beforeEach ->
        @result = @sut.translate "when I am home turn the lights on"

      it 'should return translated object', ->
        translated =
          keyphrase: "i am home"
          type: 'device:hue'
          action: 'on'
        expect(@result).to.deep.equal translated

    describe 'when called with a keyphrase', ->
      beforeEach ->
        @result = @sut.translate "i am home"

      it 'should have an empty result', ->
        expect(@result).to.be.empty
