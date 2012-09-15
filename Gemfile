source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'thor', '>=0.14.4' # I don't think this is used

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.0.3'
  gem 'therubyracer', require: 'v8'

  gem 'jquery-rails', '>=0.2.5'
  gem 'jquery-ui-rails'
  gem 'jquery_datepicker'
  gem 'bootstrap-datepicker-rails', require: 'bootstrap-datepicker-rails', git: 'git://github.com/Nerian/bootstrap-datepicker-rails.git'
  
end

group :production do
  gem "pg"
end

group :development, :test do
  gem 'sqlite3'
  gem 'heroku'
  gem 'taps' # used for heroku db:pull
end
