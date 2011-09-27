# rack-combot - ATTENTION, this stuff aint working yet :)

Asset combinator for rack 

## Installation

gem install rack-combot

### Rails apps

In your routes.rb file add the following route

```ruby
  match 'combot', :to => Rack::Combot.configure(:root => "/public")
```
