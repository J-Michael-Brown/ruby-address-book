
require('capybara/rspec')
require('./app')
require('pry')
require('contact')
Capybara.app = Sinatra::Application
set(:show_exception, false)
