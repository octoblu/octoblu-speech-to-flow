_ = require('lodash')
React = require('react')
LoginProviderLink = require('./login-provider-link')
providers = require('./providers')
Router = require('react-router')

CALLBACK_URL = "#{window.location.origin}/#/auth-login-success"

Login = React.createClass
  displayName: 'AuthLogin'

  contextTypes:
    router: React.PropTypes.func

  componentWillMount: ->
    {router} = @context
    uuid = localStorage.getItem 'meshblu_auth_uuid'
    token = localStorage.getItem 'meshblu_auth_token'
    router.transitionTo('/speech') if uuid && token

  renderProviders: ->
    _.map providers, (provider) ->
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
