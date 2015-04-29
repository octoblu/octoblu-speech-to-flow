browserSync   = require 'browser-sync'
gulp          = require 'gulp'
gutil         = require 'gulp-util'
# server        = require 'pushstate-server'
watch         = require 'gulp-autowatch'
webpack       = require 'webpack'
webpackConfig = require './webpack.config'

gulp.task 'browser-sync', ->
  browserSync.init ['./public/*.html', './public/**/*.css', './public/**/*.js'],
    server:
      baseDir: './public'

gulp.task 'webpack', ->
  webpack webpackConfig, (err, stats) ->
    if err
      throw new gutil.pluginError 'webpack', err
    gutil.log '[webpack]', stats.toString
      colors: true

gulp.task 'watch', ->
  watch gulp,
    webpack: [
      './client/**/*.js'
      './client/**/*.jsx'
      './client/**/*.cjsx'
      './client/**/*.coffee'
    ]

# gulp.task 'serve', ->
#   server.start
#     port: process.env.PORT || 3000
#     directory: './public'

gulp.task 'build', ['webpack']

gulp.task 'default', ['build', 'watch', 'browser-sync']
