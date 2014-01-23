require 'date'
require 'httparty'
require 'dotenv'

Dotenv.load

class DiabetesDashboard
  @@pancreas_api = 'https://pancreas-api.herokuapp.com/metrics'

  def self.data days = 7
    h = HTTParty.get(
        url('glucose', days),
        headers:    { 'Accept' => 'application/json' },
        basic_auth: { username: ENV['METRICS_API_USERNAME'], password: ENV['METRICS_API_PASSWORD'] }
    ).body

    j = JSON.parse h
    j['values']
  end

  def self.glucose days
    data(days).map { |i| { x: DateTime.parse(i['datetime']).strftime("%s").to_i, y: i['value'] } }
  end

  def self.glucose_average days = 7
    points = data(days)
    ((points.inject(0) { |sum, i| sum += i['value'] }) / points.length).round(1)
  end

  def self.url metric, days
    "%s/%s/%s/%s" % [
        @@pancreas_api,
        metric,
        interval(days),
        now
    ]
  end

  def self.interval days
    "PT%dH" % [
        days * 24
    ]
  end

  def self.now
    DateTime.now.iso8601.to_s
  end
end