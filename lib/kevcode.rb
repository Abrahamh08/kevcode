#!/usr/bin/ruby

class KevCode
    def initialize
    end

    def run code
        puts "run #{code}"
    end
end

if __FILE__ == $0

    require 'optparse'

    opts = {}
    OptionParser.new {|o|
        o.banner = 'Usage: ./kevcode.rb [options]'

        o.on('-e', '--exec', 'Execute a string passed as an argument') {|e|
            opts[:exec] = e
        }
    }.parse!

    k = KevCode.new
    if opts[:exec]
        k.run opts[:exec]
    else
        k.run STDIN.read
    end

end
