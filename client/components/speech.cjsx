React = require('react')

Speech = React.createClass
  displayName: 'SpeechWindow'

  getInitialState: ->
    result: ''
    recording: false

  componentWillMount: ->
    console.log 'Will Mount...'
    @recognition = new webkitSpeechRecognition()

  componentDidMount: ->
    console.log 'Did Mount...'

    @recognition.onresult = (event) =>
      @setState result: event.results[0][0].transcript

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
