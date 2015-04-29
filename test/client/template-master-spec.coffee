TemplateMaster = require '../../client/template-master'

describe 'TemplateMaster', ->
  beforeEach ->
    @request = {}
    @request.get = sinon.stub().returns @request
    @request.query = sinon.stub().returns @request
    @request.post = sinon.stub().returns @request
    @request.send = sinon.stub().returns @request
    @request.auth = sinon.stub().returns @request

    @dependencies = request: @request

  describe '->findByTag', ->
    describe 'when instantiated with a uuid and token', ->
      beforeEach ->
        credentials = uuid: 'black', token: 'green'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a tag', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: [{name: 'espresso'}, {name: 'cold-brew'}]
          @sut.findByTag 'mocha', (error, @templates) => done()

        it 'should set the auth for the request', ->
          expect(@request.auth).to.have.been.calledWith 'black','green'

        it 'should call request with the correct uri and data', ->
          expect(@request.get).to.have.been.calledWith 'https://app.octoblu.com/api/templates/public'

        it 'should call request with the correct uri and data', ->
          expect(@request.query).to.have.been.calledWith tags: ['mocha']

        it 'should call the callback with templates', ->
          expect(@templates).to.deep.equal [{name: 'espresso'}, {name: 'cold-brew'}]

    describe 'when instantiated with a different uuid and token', ->
      beforeEach ->
        credentials = uuid: 'iced', token: 'herbal'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a tag', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: [{name: 'espresso'}, {name: 'cold-brew'}]
          @sut.findByTag 'mocha', (error, @templates) => done()

        it 'should set the auth for the request', ->
          expect(@request.auth).to.have.been.calledWith 'iced','herbal'

        it 'should call request with the correct uri and data', ->
          expect(@request.get).to.have.been.calledWith 'https://app.octoblu.com/api/templates/public'

        it 'should call request with the correct uri and data', ->
          expect(@request.query).to.have.been.calledWith tags: ['mocha']

        it 'should call the callback with templates', ->
          expect(@templates).to.deep.equal [{name: 'espresso'}, {name: 'cold-brew'}]

      describe 'when called with a different tag', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields null, body: [{name: 'chai'}, {name: 'tea'}]
          @sut.findByTag 'clever', (error, @templates) => done()

        it 'should call request with the correct uri and data', ->
          expect(@request.get).to.have.been.calledWith 'https://app.octoblu.com/api/templates/public'

        it 'should call request with the correct uri and data', ->
          expect(@request.query).to.have.been.calledWith tags: ['clever']

        it 'should call the callback with templates', ->
          expect(@templates).to.deep.equal [{name: 'chai'}, {name: 'tea'}]

      describe 'when called with a different tag and it yields an error', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields 'oh no'
          @sut.findByTag 'latte', (@error) => done()

        it 'should yield an error', ->
          expect(@error).to.equal 'oh no'

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
          @request.end = sinon.stub().yields 'it did not work'
          @sut.import 'chemex', (@error) => done()

        it 'should call the callback with the error', ->
          expect(@error).to.deep.equal 'it did not work'

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

        it 'should call request.post', ->
          expect(@request.post).to.have.been.calledWith 'https://app.octoblu.com/api/templates/sweet/flows'

        it 'should yield a flow', ->
          expect(@flow).to.deep.equal flowId: 'daily-coffee'


  describe '->deployFlow', ->
    describe 'when instantiated with credentials', ->
      beforeEach ->
        credentials = uuid: 'excellente', token: 'one&one'

        @sut = new TemplateMaster credentials, @dependencies

      describe 'when called with a flowId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields()
          @sut.deployFlow 'aeropress', (@error) => done()

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
          @sut.deployFlow 'aeropress', (@error) => done()

        it 'should call request.auth with the uuid and token', ->
          expect(@request.auth).to.have.been.calledWith 'toddy', 'stupid-things'

      describe 'when called with an invalid flowId', ->
        beforeEach (done) ->
          @request.end = sinon.stub().yields 'oh boy'
          @sut.deployFlow 'latte', (@error) => done()

        it 'should throw an error', ->
          expect(@error).to.equal 'oh boy'
