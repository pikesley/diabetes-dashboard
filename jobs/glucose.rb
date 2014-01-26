SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.points('glucose', 1)
  average = DiabetesDashboard.average('glucose', 1)
  send_event('daily-blood-glucose', points: points, average: average)
end

SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.points('glucose', 7)
  average = DiabetesDashboard.average('glucose', 7)
  send_event('weekly-blood-glucose', points: points, average: average)
end

SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.points('glucose', 30)
  average = DiabetesDashboard.average('glucose', 30)
  send_event('monthly-blood-glucose', points: points, average: average)
end