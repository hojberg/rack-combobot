# rack-combobot [![Build Status](https://secure.travis-ci.org/hojberg/rack-combobot.png)](http://travis-ci.org/hojberg/rack-combobot)

Asset combinator for rack 

## Installation

`gem install rack-combobot`

### Usage in Rack apps (config.ru)

```ruby
require 'rack'
require 'rack-combobot'
require 'my-app'

use Rack::Combobot, :root => '/public'
run MyApp
```

### Usage in Rails apps

In your config/application.rb

```ruby
config.middleware.use 'Rack::Combobot', :root => "#{Rails.root}/public"
```
