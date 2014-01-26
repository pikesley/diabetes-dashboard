SCHEDULER.every '5m', :first_at => Time.now do
  average = DiabetesDashboard.average 'glucose', 1
  send_event('glucose-daily-average', current: average)
end