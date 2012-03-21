# rack-combobot [![Build Status](https://secure.travis-ci.org/hojberg/rack-combobot.png)](http://travis-ci.org/hojberg/rack-combobot)

Asset combinator for rack 

## Installation

`gem install rack-combobot`

## Path

Point your frontend to `/combobot?script1.js&script2.js` to get script1.js and script2.js combined.

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

### Expires header

Add expires header by like so

```ruby
config.middleware.use 'Rack::Combobot', :root => "#{Rails.root}/public", :expires => Time.gm(2020)
```

To bust the cache, simple add a unique string to your request like so `/combobot/BUSTINGSRING?script1.js&script2.js`.
