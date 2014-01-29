SCHEDULER.every '1h', :first_at => Time.now do
  value = DiabetesDashboard.value('Hba1c')
  send_event('latest-hba1c', current: value, suffix: '%')
end