source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem "thin"
gem "settingslogic"
group :production do
  gem "unicorn"
  gem "sprockets-redirect", github: "shawncatz/sprockets-redirect", branch: "rails4"
end

group :assets do
  gem "therubyracer", platform: :ruby
end

gem "angularjs-rails-resource"
gem "haml-rails"
gem "bootstrap-sass", "~> 2.3.2.2"
gem "simple_form"
gem "mongoid"
gem "bson"
gem "bson_ext"
gem "devise"
gem "redis-rails"

gem "sidekiq"
gem "sidekiq-failures"
gem "sidekiq-scheduler", "~> 1"
gem "sinatra"
gem "slim"

group :development do
  gem "better_errors"
  gem "binding_of_caller", platforms: [:mri_19, :mri_20, :rbx]
  gem "html2haml"
  gem "quiet_assets"
  gem "rails_layout"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "rspec-rails"
end

group :test do
  gem "capybara"
  gem "database_cleaner", "1.0.1"
  gem "email_spec"
  gem "mongoid-rspec"
end

gem "foreman"
gem "capistrano", "~> 3"
gem "capistrano-rails"
gem "capistrano-bundler"
gem "capistrano-rvm"
gem "whenever"
gem "newrelic_rpm"
