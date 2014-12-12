#!/usr/bin/ruby

class KevCode
    # because Ruby has no good way to call attr_reader on class vars
    def self.version; [0, 0, 1]; end

    def initialize
    end

    def run code
        puts "run #{code}"
        'return value'
    end
end

if __FILE__ == $0

    require 'optparse'

    opts = {}
    OptionParser.new {|o|
        o.banner = 'Usage: ./kevcode.rb [filename or options]'

        o.on('-h', '--help', 'Displays help') {
            puts o
            exit
        }

        o.on('-e', '--exec code', 'Execute a string passed as an argument') {|e|
            opts[:exec] = e
        }

        o.on('-i', '--interactive', 'Enter an interactive REPL instead') {|i|
            opts[:interactive] = i
        }
    }.parse!

    k = KevCode.new
    if opts[:exec]
        k.run opts[:exec]
    elsif opts[:interactive]
        puts "Welcome to the KevCode REPL! This is version #{KevCode.version * ?.}."
        loop {
            print '>>> '
            # R
            code = gets.chomp
            # E
            rtn = k.run code
            # P
            puts rtn
            # L
        }
    else
        # read from file as arg, or STDIN otherwise
        file = ARGV.pop
        if file
            k.run File.read(file)
        else
            k.run STDIN.read
        end
    end

end
