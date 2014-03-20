#SETTINGS = YAML.load_file("#{Rails.root.to_s}/config/settings.yml")[Rails.env]

require 'rails_config'

RailsConfig.setup do |config|
  config.const_name = "Settings"
end
