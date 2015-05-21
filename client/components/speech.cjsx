_ = require 'lodash'
React = require 'react'
TemplateMaster = require '../template-master'

Speech = React.createClass
  displayName: 'SpeechWindow'

  contextTypes:
    router: React.PropTypes.func

  getInitialState: ->
    result: ''
    recording: false

  componentWillMount: ->
    console.log 'Will Mount...'
    @recognition = new webkitSpeechRecognition()
    @templateMaster = new TemplateMaster @getCredentials()
    # @handleResponse("when I am in the office then turn the lights off")
    # setTimeout =>
    #   @handleResponse("I'm in the office")
    # , 30000

  componentDidMount: ->
    {router} = @context
    console.log 'Did Mount...'
    credentials = @getCredentials()
    return router.transitionTo('/') unless credentials.uuid?
    @templateMaster = new TemplateMaster credentials

    @recognition.onresult = (event) =>
      transcript = event.results[0][0].transcript
      @setState result: transcript
      @handleResponse transcript

    @recognition.onstart = (event) =>
      @setState recording: true

    @recognition.onend = (event) =>
      @setState recording: false

  record: (event) ->
    @recognition.start()

  getCredentials: ->
    {
      uuid: localStorage.getItem 'meshblu_auth_uuid'
      token: localStorage.getItem 'meshblu_auth_token'
    }

  handleResponse: (transcript) ->
    console.log 'transcript', transcript
    @templateMaster.createAndDeploy transcript, (error) =>
      console.error 'Error:', error if error?
      console.log('IT IS DONE!')

  render: ->
    <div className="speech">
      <h1 className="speech__header">Press the Button to begin recording....</h1>

      <textarea className="speech__result" value={@state.result}></textarea>

      <button
        onClick={@record}
        disabled={@state.recording}
        className="speech__record-button">

        <img src="https://s3-us-west-2.amazonaws.com/octoblu-icons/microphone.png" className="speech__record-button-icon"/>
      </button>
    </div>

module.exports = Speech
