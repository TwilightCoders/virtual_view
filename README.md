[![Version      ](https://img.shields.io/gem/v/virtual_view.svg?maxAge=2592000)](https://rubygems.org/gems/virtual_view)
[![Build Status ](https://travis-ci.org/TwilightCoders/virtual_view.svg)](https://travis-ci.org/TwilightCoders/virtual_view)
[![Code Climate ](https://api.codeclimate.com/v1/badges/762cdcd63990efa768b0/maintainability)](https://codeclimate.com/github/TwilightCoders/virtual_view/maintainability)
[![Test Coverage](https://codeclimate.com/github/TwilightCoders/virtual_view/badges/coverage.svg)](https://codeclimate.com/github/TwilightCoders/virtual_view/coverage)
[![Dependencies ](https://gemnasium.com/badges/github.com/TwilightCoders/virtual_view.svg)](https://gemnasium.com/github.com/TwilightCoders/virtual_view)

# VirtualView

VirtualView unlocks the ability to back your models with in-code views, best described in [Arel](https://github.com/rails/arel).

## Requirements

Ruby 2.3+
ActiveRecord 4.2+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'virtual_view'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install virtual_view

## Usage

Invoking `with_virtual_view` sets the class up to use the `virtual_view` functionality.

```ruby
class User < ActiveRecord::Base
  # the rest of your model code...
end

class Admin < User
  arel_view do
    arel_table.where(arel_table[:role].eq(1))
  end

  # the rest of your model code...
end
```

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `bundle exec rspec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TwilightCoders/virtual_view. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
