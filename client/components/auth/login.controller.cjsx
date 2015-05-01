_ = require('lodash')
React = require('react')
LoginProviderLink = require('./login-provider-link')
providers = require('./providers')
Router = require('react-router')

CALLBACK_URL = "#{window.location.origin}/#"

getParam = (variable, url=window.location.href) ->
  query = url.split('?')[1]
  return false unless query?
  query = query.replace(/\#\/.*$/, '')
  vars = query.split('&')
  console.log('vars', vars)
  return _.any vars, (value, i) ->
    pair = vars[i].split('=')
    return decodeURIComponent(pair[1]) if pair[0] == variable

Login = React.createClass
  displayName: 'AuthLogin'

  contextTypes:
    router: React.PropTypes.func

  componentWillMount: ->
    {router} = @context
    uuid = getParam('uuid')
    token = getParam('token')
    return window.location.href = '/#/speech' if uuid && token

    uuid = localStorage.getItem 'meshblu_auth_uuid'
    token = localStorage.getItem 'meshblu_auth_token'
    return router.transitionTo('/speech') if uuid && token

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
