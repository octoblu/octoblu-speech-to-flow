_ = require('lodash')
React = require('react')
LoginProviderLink = require('./login-provider-link')
providers = require('./providers')
Router = require('react-router')

CALLBACK_URL = "#{window.location.origin}/#"

getParam = (variable, url=window.location.href) ->
  value = false
  query = url.split('?')[1]
  return value unless query?
  query = query.replace(/\#\/.*$/, '')
  vars = query.split('&')
  _.each vars, (piece, i) ->
    pair = piece.split('=')
    value = decodeURIComponent(pair[1]) if pair[0] == variable
  value

Login = React.createClass
  displayName: 'AuthLogin'

  contextTypes:
    router: React.PropTypes.func

  componentWillMount: ->
    {router} = @context
    uuid = getParam('uuid')
    token = getParam('token')
    if uuid && token
      @setCredentials uuid, token
      return window.location.href = '/#/speech'

    uuid = localStorage.getItem 'meshblu_auth_uuid'
    token = localStorage.getItem 'meshblu_auth_token'
    return router.transitionTo('/speech') if uuid && token

  setCredentials: (uuid, token) ->
    localStorage.setItem "meshblu_auth_uuid", uuid
    localStorage.setItem "meshblu_auth_token", token

    console.log "UUID #{localStorage.getItem 'meshblu_auth_uuid'} Token #{localStorage.getItem 'meshblu_auth_token'}"

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
