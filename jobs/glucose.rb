SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.points('glucose', 7)
  send_event('blood-glucose', points: points)
end