# rack-combobot

Asset combinator for rack 

## Installation

`gem install rack-combobot`

### Usage in Rails apps

In your routes.rb file add the following route

```ruby
match '/combobot', :to => Rack::Combobot.configure(:root => RAILS_ROOT + "/public")
```
