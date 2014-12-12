#!/usr/bin/ruby

require 'optparse'

opts = {}
OptionParser.new {|o|
    o.banner = 'Usage: ./kevcode.rb [options]'

    o.on('-e', '--exec', 'Execute a string passed as an argument') {|e|
        opts[:exec] = e
    }
}.parse!

if opts[:exec]
    # TODO
else
    # TODO
end
