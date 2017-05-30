require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CottageSkisInventory
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_mailer.default_url_options = { host: ENV['FQDN'] || 'localhost', port: ENV['MAIL_PORT'] || 3000 }
    config.action_dispatch.default_headers.merge!('Content-Language' => 'en-US')
    Paperclip.options[:command_path] = `which convert`.strip
  end
end
