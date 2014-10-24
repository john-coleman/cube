source 'https://rubygems.org'

gem 'rails', '~> 4.1.6'
gem 'mysql2'
# gem 'omniauth-ldap', github: 'intridea/omniauth-ldap'
gem 'syslogger'

# Use unicorn as the app server. Why: https://blog.engineyard.com/2014/ruby-app-server-arena-pt2
gem 'unicorn'

gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'haml', '~> 4.0.0'

gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bundler-audit', require: false
  # Use Capistrano for deployment
  # gem 'capistrano-rails'
  gem 'codesake-dawn', require: false
  gem 'guard'
  gem 'guard-brakeman'
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-migrate'
  gem 'guard-rspec', '>= 4.2.6'
  gem 'guard-rubocop'
  # gem 'letter_opener'
  gem 'quiet_assets'
  # Use sqlite3 as the database for Active Record if you don't have MySQL installed
  # gem 'sqlite3'
  gem 'thin'
end

group :test do
  # gem 'selenium-webdriver' # uncomment if you want to use @selenium in you cucumber tests
  gem 'brakeman', require: false
  gem 'capybara-webkit'
  gem 'cucumber'
  gem 'cucumber-rails', '>= 1.4.1', require: false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'stepdown', require: false
  gem 'therubyracer', require: 'v8'
  gem 'timecop'
end

group :test, :development do
  gem 'awesome_print'
  # gem 'debugger'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'rubocop'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-cucumber'
  gem 'spring-commands-rspec'
end
