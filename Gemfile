source 'https://rubygems.org'


gem 'rails', '~> 5.0.0'

# ===== Infrastructure =====
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'bcrypt'

gem 'dotenv-rails'
gem 'rollbar'

# ===== Frontend =====
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# ===== Web architecture =====
gem 'dry-validation'
gem 'trailblazer'
gem 'trailblazer-rails'
gem 'reform'
gem 'representable'
gem 'responders'

group :development, :test do
  gem 'pry-byebug', platform: :mri
  gem 'faker', require: false
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov'
  gem "codeclimate-test-reporter", require: nil
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
