React = require('react')
Speech = require('./components/speech')

App = React.createClass
  displayName: 'HelloWorld'

  render: ->
    <div>
      <Speech />
    </div>

React.render(<App />, document.getElementById('app'));
