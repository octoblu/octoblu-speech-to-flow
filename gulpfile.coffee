server        = require 'gulp-webserver'
gulp          = require 'gulp'
gutil         = require 'gulp-util'
watch         = require 'gulp-autowatch'
webpack       = require 'webpack'
webpackConfig = require './webpack.config'

gulp.task 'server', ->
  gulp
    .src('public')
    .pipe(server({
      livereload: true,
      directoryListing: false,
      open: true,
      fallback: 'index.html'
    }))

gulp.task 'webpack', ->
  webpack webpackConfig, (err, stats) ->
    throw new gutil.pluginError 'webpack', err if err

gulp.task 'watch', ->
  watch gulp,
    webpack: [
      './client/**/*.js'
      './client/**/*.jsx'
      './client/**/*.cjsx'
      './client/**/*.coffee'
    ]

gulp.task 'build', ['webpack']

gulp.task 'default', ['build', 'watch', 'server']
