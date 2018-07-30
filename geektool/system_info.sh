#!/bin/bash

# Basic System informations
# Don't change so don't refresh them often

computer_name() {
  scutil --get ComputerName
}

system_version() {
  sw_vers | awk -F':\t' '{print $2}' | paste -d ' ' - - -
}

cpu_information() {
  sysctl -n machdep.cpu.brand_string
}

memory_size() {
  sysctl -n hw.memsize | awk '{print $0/1073741824" GB RAM"}'
}

computer_name
system_version
cpu_information
memory_size
