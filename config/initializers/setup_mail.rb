if Rails.env != 'test'
  email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/settings.yml"))
  ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings[Rails.env].nil?
end