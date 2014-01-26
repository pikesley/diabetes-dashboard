SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.doses('Breakfast', 7)
  average = DiabetesDashboard.average('Breakfast', 7)
  send_event('weekly-breakfast-doses', points: points, average: average)
end

SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.doses('Lunch', 7)
  average = DiabetesDashboard.average('Lunch', 7)
  send_event('weekly-lunch-doses', points: points, average: average)
end

SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.doses('Dinner', 7)
  average = DiabetesDashboard.average('Dinner', 7)
  send_event('weekly-dinner-doses', points: points, average: average)
end

SCHEDULER.every '5m', :first_at => Time.now do
  points = DiabetesDashboard.doses('Bedtime', 7)
  average = DiabetesDashboard.average('Bedtime', 7)
  send_event('weekly-bedtime-doses', points: points, average: average)
end