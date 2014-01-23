# Populate the graph with some random points
#points = []
#(1..10).each do |i|
#  points << { x: i, y: rand(50) }
#end
#last_x = points.last[:x]

#SCHEDULER.every '2s' do
#  points.shift
#  last_x += 1
#  points << { x: last_x, y: rand(50) }
#
#  send_event('convergence', points: points)
#end

require 'date'
require 'httparty'
require 'json'

SCHEDULER.every '2s' do
  h    = HTTParty.get("https://pancreas-api.herokuapp.com/metrics/glucose/P7D/2014-01-23", headers: { 'Accept' => 'application/json' }, basic_auth: { username: 'hba1c', password: 'nelsucFek6' }).body
  j    = JSON.parse h
  data = j['values']
  points = data.map { |i| { x: DateTime.parse(i['datetime']).strftime("%s").to_i, y: i['value'] } }
  send_event('blood-glucose', points: points)
end