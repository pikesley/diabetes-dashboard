require 'date'
require 'httparty'
require 'dotenv'

Dotenv.load

class DiabetesDashboard
  @@pancreas_api = 'https://pancreas-api.herokuapp.com/metrics'

  def self.data metric, days = nil
    h = HTTParty.get(
        url(metric, days),
        headers:    { 'Accept' => 'application/json' },
        basic_auth: { username: ENV['METRICS_API_USERNAME'], password: ENV['METRICS_API_PASSWORD'] }
    ).body

    j = JSON.parse h
    if days.nil?
      return j
    end
    j['values']
  end

  def self.average metric, days = nil
    filter   = false
    category = nil
    if [
        'Breakfast',
        'Lunch',
        'Dinner'
    ].include? metric
      category = metric
      metric   = 'humalog'
      filter   = true
    end
    if [
        'Bedtime'
    ].include? metric
      category = metric
      metric   = 'lantus'
      filter   = true
    end

    points = data(metric, days)

    if filter
      points.select! { |i| i['category'] == category }
    end

    ((points.inject(0) { |sum, i| sum += i['value'] }) / points.length).round(1)
  end

  def self.points metric, days
    data(metric, days).map { |i| { x: datestamp(i['datetime']), y: i['value'] } }
  end

  def self.doses category, days = nil
    metric = 'humalog'
    if category == 'Bedtime'
      metric = 'lantus'
    end

    d = data(metric, days)
    d.select! { |i| i['category'] == category }
    d.map { |i| { x: datestamp(i['datetime']), y: i['value'] } }
  end

  def self.value metric
    d = data(metric.downcase)
    d['value']
  end

  def self.datestamp datetime
    DateTime.parse(datetime).strftime("%s").to_i
  end

  def self.url metric, days = nil
    url = "%s/%s" % [
        @@pancreas_api,
        metric
    ]

    if days
      url = "%s/%s/%s" % [
          url,
          interval(days),
          now
      ]
    end

    url
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