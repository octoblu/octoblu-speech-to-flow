_ = require('lodash')
React = require('react')
LoginProviderLink = require('./login-provider-link')
providers = require('./providers')

CALLBACK_URL = "#{window.location.origin}/#/auth-login-success"

Login = React.createClass
  displayName: 'AuthLogin'

  renderProviders: ->
    _.map providers, (provider) ->
      console.log CALLBACK_URL
      providerUrlWithCallback = provider.url + encodeURIComponent(CALLBACK_URL)
      <LoginProviderLink
        name={provider.name}
        classes={provider.classes}
        url={providerUrlWithCallback}/>

  render: ->
    <div className="auth-login__providers">
      {@renderProviders()}
    </div>

module.exports = Login
