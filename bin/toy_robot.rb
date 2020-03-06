#!/usr/bin/env ruby

# Import required classes
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'toy_robot'

puts ' ------------------------------------------------------------------'
puts "|          Please Enter any of the Following Commands:             |\n"
puts "|       PLACE X,Y,F | MOVE | LEFT | RIGHT | REPORT | EXIT          |\n"
puts ' ------------------------------------------------------------------'
ToyRobot.main