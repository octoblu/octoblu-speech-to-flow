_ = require('lodash')
React = require('react')
Router = require('react-router')

LoginSuccess = React.createClass
  displayName: 'LoginSuccess'

  contextTypes:
    router: React.PropTypes.func

  componentDidMount: ->
    {router} = @context
    uuid = router.getCurrentQuery().uuid
    token = router.getCurrentQuery().token

    if uuid && token
      @setCredentials(uuid, token)
      router.transitionTo('/speech')
    else
      router.transitionTo('/')

  setCredentials: (uuid, token) ->
    localStorage.setItem "meshblu_auth_uuid", uuid
    localStorage.setItem "meshblu_auth_token", token

    console.log "UUID #{localStorage.getItem 'meshblu_auth_uuid'} Token #{localStorage.getItem 'meshblu_auth_token'}"

  render: ->
    <h1>Success</h1>

module.exports = LoginSuccess
