React = require('react')

App = React.createClass
  displayName: 'HelloWorld'

  render: ->
    <div>
      <h1>Hello, World!</h1>
    </div>

React.render(<App />, document.getElementById('app'));
