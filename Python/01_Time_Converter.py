def convert_minutes(total_minutes):
  hours = total_minutes // 60
  minutes = total_minutes % 60
  print (f"{hours} hours and {minutes} minutes")

convert_minutes(130)
# output: 2 hours and 10 minutes
convert_minutes(110)
# output: 1 hours and 50 minutes
convert_minutes(481)
# output: 8 hours and 1 minutes
