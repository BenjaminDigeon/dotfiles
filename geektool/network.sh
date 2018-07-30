#!/bin/bash

declare -a currentservices
declare -a devaddress

# Get list of network interfaces contqining the name and devID
services=$(networksetup -listnetworkserviceorder | grep 'Hardware Port')

# Parse the giant string on delimiters...
while read line; do
  sname=$(echo $line | awk -F  "(, )|(: )|[)]" '{print $2}')
  #echo $sname
  sdev=$(echo $line | awk -F  "(, )|(: )|[)]" '{print $4}')
  #echo "Current service: $sname, $sdev, $currentservice"

  # if device has a valid device ID,
  if [ -n "$sdev" ]; then
    # ask ifconfig for its status. (2>/dev/null = do it silently)...
    ifconfig $sdev 2>/dev/null | grep 'status: active' > /dev/null 2>&1
    # but capture the return code.
    rc="$?"
    # If return code is non-zero...
    if [ "$rc" -eq 0 ]; then
      # replace spaces with underscores to prevent value from
      # fragmenting into fields in the array.
      snameFX=$(echo $sname | sed -e 's/ /_/g')
      # Append service name to this array
      currentservices=(${currentservices[@]} "$snameFX")
    fi
  fi
done <<< "$(echo "$services")" #'Here-String' to feed the services list into the while loop.
#printf '%s\n' "${currentservices[@]}";

# If current services array is not empty...
if [ -n $currentservices ]; then
  for i in "${currentservices[@]}"; do
    # Set new var $iFace to hold value of $i, with spaces restored,
    iFace=$(echo $i | sed s/_/\ /g)
    # Look up the IP address for each value by "name" using networksetup
    IPAddy=$(networksetup -getinfo "$iFace"| grep "^IP address" | sed s/"^IP address: "//)
    TheLine=$"$i:,$IPAddy"
    devaddress=(${devaddress[@]} "$TheLine")
  done

  # Format it in pretty-ish columns
  printf '%s\n' "${devaddress[@]}"|column -s "," -t
else
  >&2 echo "Could not find current service"
  exit 1
fi
