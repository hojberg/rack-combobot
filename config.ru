require 'rack'
require './lib/rack-combobot'

run Rack::Combobot.configure :root => 'spec/public'
