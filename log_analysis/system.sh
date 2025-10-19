'#!/bin/bash

LOGFILE="system.log"

# Q1: debug messages
q1=$(grep ' D ' "$LOGFILE" | wc -l)

# Q2: OS
q2="Android"

# Q3 & Q4: fingerprint accepted / denied
# Each attempt is a block of 3 lines starting with bauth_FPBAuthService
# Accepted if 'I' info, denied if 'W' or 'E'
q3=$(awk '/bauth_FPBAuthService/ {if ($3=="I") acc++} END{print acc+0}' "$LOGFILE")
q4=$(awk '/bauth_FPBAuthService/ {if ($3=="W" || $3=="E") den++} END{print den+0}' "$LOGFILE")

# Q5: application ID from first accepted fingerprint
q5=$(awk '/bauth_FPBAuthService/ && $3=="I" {split($0,a,"pcf : "); split(a[2],b,","); print b[1]; exit}' "$LOGFILE")

# Q6: WiFi network
# Look for EPDG lines and get text inside square brackets containing 'WIFI' or 'wifi'
q6=$(grep -i 'EPDG' "$LOGFILE" | grep -i 'wifi' | head -n1 | sed -n 's/.*\[\(.*WIFI.*\)\].*/\1/p')

# Q7: battery percentage at end
q7=$(grep -i 'KeyguardSecIndicationPolicy' "$LOGFILE" | grep -o 'Charging: [0-9]\+' | tail -n1 | awk '{print $2}')

# Q8: first alarm timestamp
q8=$(grep -i alarm "$LOGFILE" | head -n1 | awk '{print $1" "$2}')

# Q9: flashlight duration in ms
# Convert HH:MM:SS.sss to ms safely
time_to_ms() {
  IFS=: read h m s <<< "$1"
  ms=$(echo "$s" | awk -F. '{print $1*1000 + $2}')
  echo $((10#$h*3600*1000 + 10#$m*60*1000 + ms))
}

on_time=$(grep -i 'Torch.*on' "$LOGFILE" | tail -n1 | awk '{print $2}')
off_time=$(grep -i 'Torch.*off' "$LOGFILE" | tail -n1 | awk '{print $2}')
if [[ -n "$on_time" && -n "$off_time" ]]; then
  ms_on=$(time_to_ms "$on_time")
  ms_off=$(time_to_ms "$off_time")
  q9=$((ms_off - ms_on))
else
  q9="N/A"
fi

# Q10 & Q11: Manufacturer & model
q10=$(grep -i 'ro.product.manufacturer' "$LOGFILE" | head -n1 | awk -F= '{print $2}')
q11=$(grep -i 'ro.product.model' "$LOGFILE" | head -n1 | awk -F= '{print $2}')

# Print answers
echo "Q1: $q1"
echo "Q2: $q2"
echo "Q3: $q3"
echo "Q4: $q4"
echo "Q5: $q5"
echo "Q6: $q6"
echo "Q7: $q7"
echo "Q8: $q8"
echo "Q9: $q9"
echo "Q10: $q10"
echo "Q11: $q11"

