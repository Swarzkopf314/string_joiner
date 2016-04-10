# StringJoiner

Adds StringJoiner class providing simple functionality for joining strings, such that you don't need to worry about blanks, separators, symbols, nils etc. Has no (production) dependecies. Requires Ruby 2.0 .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_joiner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_joiner

## Usage

	StringJoiner.new << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ' # => "lala, loves, me!"

	StringJoiner.new(' ', ',', allow_blanks: true, allow_leading_separator: true) << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', " , ,lala,loves, ,me!,, "

Also take a peek at tests.

Note, that StringJoiner does not override String#concat nor String#+. You can monkey patch this if you wish (just delegating these two to <<) 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/string_joiner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

