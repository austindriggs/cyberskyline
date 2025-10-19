awk '
{
  # Extract device ID from brackets []
  start=index($0,"[")+1
  end=index($0,"]")
  device_id=substr($0,start,end-start)

  # Extract device type from braces {}
  start=index($0,"{")+1
  end=index($0,"}")
  device_type=substr($0,start,end-start)

  # Extract battery percentage (number before %)
  split($0, parts, " ")
  battery_str=parts[4]
  sub(/%/,"",battery_str)
  battery=battery_str+0

  # Extract last number (power reading)
  power=parts[length(parts)]+0

  # Collect unique devices and types
  devices[device_id]=1
  types[device_type]=1

  # Sum battery for average
  battery_sum+=battery
  battery_count++

  # Power meters
  if(device_type=="POWER_METER"){
    power_sum+=power
    split(parts[1], d, "T")
    power_day[d[1]]+=power
  }
}
END{
  # Q1
  print "Q1:", length(devices)
  # Q2
  print "Q2:", length(types)
  # Q3
  print "Q3:", int(battery_sum/battery_count + 0.5) "%"
  # Q4
  print "Q4:", power_sum

  # Q5 + Q6
  max_day=""
  max_power=0
  for(day in power_day){
    if(power_day[day]>max_power){
      max_day=day
      max_power=power_day[day]
    }
  }
  print "Q5:", max_day
  print "Q6:", max_power
}
' devices.log
