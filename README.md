[![Build Status](http://b.adge.me/travis/pikesley/diabetes-dashboard.svg)](https://travis-ci.org/pikesley/diabetes-dashboard)
[![Coverage Status](http://b.adge.me/coveralls/pikesley/diabetes-dashboard.svg)](https://coveralls.io/r/pikesley/diabetes-dashboard)
[![Dependency Status](http://b.adge.me/gemnasium/pikesley/diabetes-dashboard.svg)](https://gemnasium.com/pikesley/diabetes-dashboard)
[![Code Climate](http://b.adge.me/codeclimate/github/pikesley/diabetes-dashboard.svg)](https://codeclimate.com/github/pikesley/diabetes-dashboard)
[![License](http://b.adge.me/:license-mit-blue.svg)](http://pikesley.mit-license.org/)

A Dashing dashboard, driven by my [Pancreas API](http://pancreas-api.herokuapp.com/). Right now it shows:

* Daily, weekly and 30-day blood-glucose graphs and averages
* Weekly breakfast, lunch, dinner and bedtime medication graphs and averages

There'll be a lot more sophisticated stuff here once I've worked out Coffeescript and [Rickshaw](http://code.shutterstock.com/rickshaw/)

# Deployment

This is a straight-up Rack app, it should deploy right onto Heroku. The Heroku environment will need to know about `METRICS_API_USERNAME` and `METRICS_API_PASSWORD` which you'll have set [here](http://pancreas-api.herokuapp.com/#dropbox-integration)

Check out [http://shopify.github.com/dashing](http://shopify.github.com/dashing) for more on Dashing
