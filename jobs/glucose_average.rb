SCHEDULER.every '5m', :first_at => Time.now do
  average = DiabetesDashboard.average 'glucose', 1
  send_event('glucose-daily-average', current: average)
end

SCHEDULER.every '5m', :first_at => Time.now do
  average = DiabetesDashboard.average 'glucose', 7
  send_event('glucose-weekly-average', current: average)
end

SCHEDULER.every '5m', :first_at => Time.now do
  average = DiabetesDashboard.average 'glucose', 30
  send_event('glucose-monthly-average', current: average)
end