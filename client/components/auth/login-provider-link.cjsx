React = require('react')

LoginProviderLink = React.createClass
  displayName: 'LoginProviderLink'

  render: ->
    <a href={@props.url} className= "auth-login__provider">
      <span className={@props.classes}>
        {@props.name}
      </span>
    </a>

module.exports = LoginProviderLink
