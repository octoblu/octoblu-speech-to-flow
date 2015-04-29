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

  componentDidMount: ->
    console.log 'Did Mount...'
    @templateMaster = new TemplateMaster @getCredentials()

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
  setCredential: ->
    {router} = @context
    uuid = router.getCurrentQuery().uuid
    token = router.getCurrentQuery().token

    if uuid && token
      localStorage.setItem "meshblu_auth_uuid", uuid
      localStorage.setItem "meshblu_auth_token", token

  handleResponse: (transcript) ->
    console.log 'transcript', transcript
    @templateMaster.findAndDeploy [transcript], (error) =>
      console.error 'Error:', error if error?

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
