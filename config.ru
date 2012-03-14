require 'rack'
require './lib/rack-combobot'

use Rack::Combobot, :root => 'spec/public'

run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Dummy App"]] }
