React = require('react')
Router = require('react-router')
{ Route, RouteHandler, Link } = Router


App = React.createClass
  displayName: 'App'

  render: ->
    <RouteHandler/>

module.exports = App
