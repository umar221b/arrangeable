# Arrangeable

Arrangeable provides an organized and seamless way to sort your ActiveRecord objects by different attributes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arrangeable', '~> 0.1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arrangeable

## Usage

Include Arrangeable inside ApplicationRecord or directly inside your ActiveRecord model and override the `arrangeable_fields` method for each model to whitelist the fields you want to use for sorting:

```ruby
class User < ApplicationRecord
  include Arrangeable

  concerning :Arranging do
    class_methods do
      def arrangeable_fields
        %w[id first_name last_name]
      end
    end
  end
end
```

Failing to override `arrangeable_fields` will raise a `NotImplementedError`.

Now sort your objects by calling `arrange` on your model and passing a comma-separated order string. Prepend a negative sign `-` before a key to order by that key descendingly:

```ruby

@users = User.all

order_string = 'first_name,-id'
@users = @users.arrange(order_string)
```

The previous example will generate the following SQL order clause: `ORDER BY first_name ASC, id DESC`.

Note that `id` can always be used for sorting regardless of whether you whitelist it or not. Any non whitelisted sorting keys will be ignored.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/umar221b/arrangeable.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
