source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'active_model_serializers'

gem 'ffaker'

gem 'faker'

gem 'sidekiq'

# OAuth JSON Web Token (JWT)
gem 'jwt', '1.5.6'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '4.8.0'
# Track changes to your models, for auditing or versioning
gem 'paper_trail', '7.1.3'
# ActiveRecord plugin allowing you to hide and restore records without actually deleting them.
gem 'paranoia', '2.4.0'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '1.0.2'

# Ransack is the successor to the MetaSearch
gem 'ransack', '1.8.6'

gem 'versionist', '1.5.0'
gem 'whenever', '0.10.0', :require => false
gem 'will_paginate', '3.1.6'
gem 'unicorn-rails', '2.2.1'

gem 'carrierwave', '~> 1.0'

gem 'enumerize'

# This library provides methods to transliterate Unicode characters to an ASCII approximation.
gem 'unidecoder', '1.1.2'

gem 'i18n', '0.9.3'

gem 'validates_timeliness', '~> 4.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', '0.49.1', require: false, groups: %i[development test]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'awesome_print'
  gem 'rails-erd', require: false
  gem 'bullet'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
