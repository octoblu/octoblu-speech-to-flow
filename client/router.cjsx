React = require('react')
Router = require('react-router')
{ Redirect, Route, RouteHandler, Link, DefaultRoute, NotFoundRoute } = Router

App = require('./app')
Login = require('./components/auth/login.controller')
LoginSuccess = require('./components/auth/login-success')
Speech = require('./components/speech')

routes =
  <Route handler={App} path="/">
    <DefaultRoute handler={Login} />
    <Route name="speech" handler={Speech} />
    <Route name="auth-login-success" handler={LoginSuccess} />
    <NotFoundRoute handler={Login}/>

    <Redirect from="auth-login-success" to="speech" />
  </Route>


Router.run routes, (Handler) ->
  React.render(<Handler/>, document.getElementById('app'))
