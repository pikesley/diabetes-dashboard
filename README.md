[![Build Status](http://img.shields.io/travis/pikesley/diabetes-dashboard.svg)](https://travis-ci.org/pikesley/diabetes-dashboard)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/diabetes-dashboard.svg)](https://coveralls.io/r/pikesley/diabetes-dashboard)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/diabetes-dashboard.svg)](https://gemnasium.com/pikesley/diabetes-dashboard)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/diabetes-dashboard.svg)](https://codeclimate.com/github/pikesley/diabetes-dashboard)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)

A Dashing dashboard, driven by my [Pancreas API](http://pancreas-api.herokuapp.com/). Right now it shows:

* Daily, weekly and 30-day blood-glucose graphs and averages
* Weekly breakfast, lunch, dinner and bedtime medication graphs and averages

There'll be a lot more sophisticated stuff here once I've worked out Coffeescript and [Rickshaw](http://code.shutterstock.com/rickshaw/)

# Deployment

This is a straight-up Rack app, it should deploy right onto Heroku. The Heroku environment will need to know about 

* `METRICS_API_USERNAME` and 
* `METRICS_API_PASSWORD` 

to access the Pancreas API (you'll have set these [here](http://pancreas-api.herokuapp.com/#dropbox-integration)), and 

* `DASHBOARD_USERNAME` and
* `DASHBOARD_PASSWORD`

which will allow you into the dashboard

# Dashing is awesome

See [http://shopify.github.com/dashing](http://shopify.github.com/dashing) for more on Dashing
