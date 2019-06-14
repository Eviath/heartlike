# Heartlike
Heartlike RoR Blog Engine.

### Heartlike can be so awesome thanks to these things.
  - Ruby on Rails
  - Devise
  - Bootstrap
  - Font Awesome
  - Sass
  - JQuery


## Prerequisites

 Heartlike depends on Active Storage. You have to install it and configure to suite your needs.
 

## Layout
Engine is using your application stylesheets and layout file by default, to include heartlike stylesheet and layout, require it in your assetpipeline like this:

    *= require 'heartlike/application'

or in scss

    @import 'heartlike/application'
    
in layouts/application body

    <%= include_heartlike_template %>
 
## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'heartlike'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install heartlike
```

Generate migrations:

    rails heartlike:install:migrations
    
Run migrations

    rails db:migrate

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
