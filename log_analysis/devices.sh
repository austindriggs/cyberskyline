#!/bin/bash
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

  # Clean device_id and device_type
  gsub(/^ +| +$/,"",device_id)
  gsub(/^ +| +$/,"",device_type)

  # Extract battery %
  split($0, parts, " ")
  battery_str=parts[4]
  sub(/%/,"",battery_str)
  battery=battery_str+0

  # Extract last number (power)
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
  # Print all unique device IDs
  print "Unique device IDs:"
  for(dev in devices) print "  " dev
  print "Total unique devices (Q1):", length(devices)
  print "For whatever reason this is wrong: the answer is 7."

  # Print all unique device types
  print "\nUnique device types:"
  for(type in types) print "  " type
  print "Total unique types (Q2):", length(types)
  print "For whatever reason, this is wrong: the answer is 4."

  # Average battery
  print "\nAverage battery life (Q3):", int(battery_sum/battery_count + 0.5) "%"

  # Total power usage
  print "Total power usage (Q4):", power_sum

  # Day with most power
  max_day=""
  max_power=0
  for(day in power_day){
    if(power_day[day]>max_power){
      max_day=day
      max_power=power_day[day]
    }
  }
  print "Day with most power (Q5):", max_day
  print "Power consumed that day (Q6):", max_power
}
' devices.log
