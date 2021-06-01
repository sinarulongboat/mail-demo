require 'optparse'

class CLIParser
  attr_reader :options
  def initialize
    @options = {}
    OptionParser.new do |opts|
      opts.banner = 'Usage: main.rb [options]'

      opts.on('-t', '--template TEMPLATE', 'Specific template name') do |template|
        @options[:template] = template
      end
    end.parse!
  end

  def template
    options[:template]
  end
end
