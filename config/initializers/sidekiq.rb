require 'sidekiq'
require 'sidekiq/scheduler'

# Sidekiq.schedule = YAML.load_file(File.expand_path("#{Rails.root}/config/schedule.yml"))

Sidekiq.configure_client do |config|
  # config.client_middleware do |chain|
  #   chain.add Sidekiq::Status::ClientMiddleware
  # end
  config.redis = { :namespace => 'easybakeoven', :url => 'redis://127.0.0.1:6379/0' }
end

Sidekiq.configure_server do |config|
  # config.server_middleware do |chain|
  #   chain.add Kiqstand::Middleware
  # end
  # config.server_middleware do |chain|
  #   chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
  # end
  config.redis = { :namespace => 'easybakeoven', :url => 'redis://127.0.0.1:6379/0' }
end
