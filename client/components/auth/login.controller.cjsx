_ = require('lodash')
React = require('react')
LoginProviderLink = require('./login-provider-link')
providers = require('./providers')

CALLBACK_URL = "#{window.location.origin}/auth-login-success"

Login = React.createClass
  displayName: 'AuthLogin'

  renderProviders: ->
    _.map providers, (provider) ->
      providerUrlWithCallback = provider.url + encodeURIComponent(CALLBACK_URL)
      <LoginProviderLink
        name={provider.name}
        classes={provider.classes}
        url={providerUrlWithCallback}/>

  render: ->
    providerList = @renderProviders()
    <div className="auth-login__providers">
      {providerList}
    </div>

module.exports = Login
