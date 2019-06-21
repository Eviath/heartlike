## DO NOT USE IN PRODUCTION! WORK IN PROGRESS
Im in early learning process of building engines with RoR, there is a good amount of possibility that this code is not written in the best way possible. Code is not fully tested nor designed to work in production at that stage. 

#### I would be grateful for any constructive criticism and help.

# Heartlike
Heartlike RoR Blog Engine with custom Admin panel.


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

#### Admin panel
You can override/add resources by editing this file in your application:
    
    app/heartlike/admin/resources.rb
    
    
You can define resources and fields to show on dashboard pages, you can see how to do it in the file :
        
        lib/heartlike/admin/resources/resources.rb
        
   
```ruby
  ATTRIBUTE_TYPES = {
      id: 'integer',
      title: 'string',
      body: 'text',
      created_at: 'date',
      updated_at: 'date',
      category_id: 'select',
      user_id: 'select',
      article_id: 'select'
  }

  COLLECTION_ATTRIBUTES = %w[id name email title created_at user_id].freeze

  SHOW_ATTRIBUTES = %w[id title body user_id category_id article_id].freeze

  FORM_ATTRIBUTES = %w[body name email title created_at updated_at user_id category_id article_id heart_id].freeze

```

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
