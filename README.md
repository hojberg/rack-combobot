# rack-combot

Combines assets into single files to improve performance.

## Installation

gem install rack-combot

### Rails apps

In your routes.rb file add the following route
```ruby
match 'combot', :to => RackCombot.new
```
