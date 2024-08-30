#!/bin/sh

while true; do
  # Get the battery percentage and charging status using acpi
  battery_info=$(acpi -b)
  percentage=$(echo "$battery_info" | grep -o '[0-9]*%' | tr -d '%')
  status=$(echo "$battery_info" | grep -o 'Charging\|Discharging')

  # Print the battery percentage every minute
  echo "Battery percentage: $percentage%"

  # Check if the battery percentage is less than or equal to 20 and not charging
  if [ "$percentage" -le 20 ] && [ "$status" = "Discharging" ]; then
    echo "Charge the laptop"
  fi

  # Sleep for 1 minute before checking again
  sleep 60
done
