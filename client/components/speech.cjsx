React = require 'react'
TemplateMaster = require '../template-master'
_ = require 'lodash'

Speech = React.createClass
  displayName: 'SpeechWindow'

  getInitialState: ->
    result: ''
    recording: false

  componentWillMount: ->
    console.log 'Will Mount...'
    @recognition = new webkitSpeechRecognition()
    @templateMaster = new TemplateMaster @getCredentials()

  getCredentials: ->
    uuid: window.localStorage.getItem 'meshblu_auth_uuid'
    token: window.localStorage.getItem 'meshblu_auth_token'

  handleResponse: (transcript) ->
    console.log 'transcript', transcript
    @templateMaster.findAndDeploy [transcript], (error) =>
      console.error 'Error:', error if error?

  componentDidMount: ->
    console.log 'Did Mount...'

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

  render: ->
    <div className="speech-window">
      <h1>Press the Button to begin recording....</h1>

      <button
        onClick={@record}
        disabled={@state.recording}
        className="speech__record__button">
        Record
      </button>

      <p className="speech__result">{@state.result}</p>
    </div>

module.exports = Speech
