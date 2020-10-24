require "stringio"
require_relative 'era.rb'
Era.new.convert_from_std(STDIN, STDOUT)
