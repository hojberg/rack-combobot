# rack-combobot - ATTENTION, this stuff aint working yet :)

Asset combinator for rack 

## Installation

gem install rack-combobot

### Rails apps

In your routes.rb file add the following route

```ruby
  match 'combot', :to => Rack::Combobot.configure(:root => "/public")
```
