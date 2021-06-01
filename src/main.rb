require_relative 'template'
require_relative 'cli_parser'
require 'redis'
require 'json'
require 'byebug'

cli = CLIParser.new
file_path = File.join(__dir__, '..', 'fixture_templates', "#{cli.template}.yml")
unless File.exist? file_path
  puts 'given template is not present'
  exit 1
end

template = Template.new(file_path)
versions = template.all_versions

template_data = versions.sample
json_data = JSON.dump(template_data)
puts 'writing JSON:'
pp template_data

redis = Redis.new
redis.lpush('longboat_mailer', json_data)
