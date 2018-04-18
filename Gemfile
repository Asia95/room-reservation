source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

#ruby '2.3.3', :engine => 'jruby', :engine_version => '9.1.16.0'
ruby '2.3.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# group :development, :production do
#   gem 'pg'
# end
gem 'pg'
#gem 'activerecord-jdbcpostgresql-adapter'
gem 'rails_12factor'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'


gem 'devise'

gem 'toastr_rails'
gem 'bootstrap-sass'
gem 'bootstrap_form'
#gem 'autopprefixer-rails'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'jquery-turbolinks'
gem 'rails-assets-jquery', source: 'http://insecure.rails-assets.org'
gem 'rails-assets-datatables', source: 'http://insecure.rails-assets.org'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'validates_timeliness'

gem 'rails_admin', '~> 1.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  gem 'rspec-rails'
  gem 'factory_bot_rails'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner'
  gem 'faker'
  gem 'simplecov', :require => false
end