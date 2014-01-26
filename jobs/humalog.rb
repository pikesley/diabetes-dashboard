SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.points('humalog', 7)
  send_event('humalog', points: points)
end