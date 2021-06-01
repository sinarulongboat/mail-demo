require 'yaml'
require_relative 'data_sample'

class Template
  attr_reader :template

  def initialize(fixture_location)
    yaml_text = File.read(fixture_location)
    @template = YAML.safe_load(yaml_text)
  end

  def languages
    template['languages']
  end

  def all_versions
    languages.map do |lang|
      to_json(lang)
    end
  end

  private

  def to_json(lang)
    {
      data: data_fields,
      language: lang,
      template: template['template'],
      to: "#{template['template'].gsub('/', '_')}_#{lang}@longboat.com"
    }
  end

  def data_fields
    template['data'].transform_values { |value| data_value(value) }
  end

  def data_value(value)
    return value unless value[0] == '$'

    klass, klass_method = value[1..].split('.')
    Kernel.const_get(klass).send(klass_method)
  end
end
