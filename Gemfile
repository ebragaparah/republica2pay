source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'devise', '~> 2.0.4'
gem 'cancan', '~> 1.6.7'
gem 'rails_admin'

gem 'cocoon', '~> 1.0.20'
gem 'haml-rails', '~> 0.3.4'
gem 'inherited_resources', '~> 1.3.1'
gem 'formtastic', '~> 2.2.0'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platform => :ruby
  gem 'execjs'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'turn', :require => false
  gem 'steak'
  gem 'factory_girl_rails'
  gem 'valid_attribute'
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.13.2'
end