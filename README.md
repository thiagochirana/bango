# TellIo

TellIo is a Ruby gem designed for phone number validation, formatting, and generation based on country-specific rules.

## Installation

You need to use Ruby 3.1 or higher!

So, add this line to your application's Gemfile:

```ruby
gem 'tell_io'
```

Then execute:

```sh
bundle install
```

Or install it manually with:

```sh
gem install tell_io
```

## Usage

### Validate a Phone Number

```ruby
TellIo.valid_phone?(phone: "+5562999990123", country: :brazil) # => true or false
```

### Format a Phone Number

```ruby
TellIo.format_phone(phone: "62999990123", country: :brazil) # => "(62) 99999-0123"
```

### Generate a Random Phone Number

```ruby
TellIo.generate_phone(country: :brazil) # => "+55XX9XXXXYYYY"
```

## Supported Countries

- Brazil (`:brazil`)

We are adding these countries in the future.

- United States (`:usa`)
- Argentina (`:argentina`)
- Canada (`:canada`)
- Portugal (`:portugal`)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature-name`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature-name`)
5. Open a pull request

We need to implement more countries in this project, fell free to implement your country!

## License

This project is licensed under the MIT License.

## The name 'Tell IO'

As you can see, dev is not creative, so this name was one of the first to be thought of.
When this project started, its name was going to be “Bango” (which means “number” in Japanese), but I didn't think it was cool so I used the convenient one
