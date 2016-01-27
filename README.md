# `makersinit`

Makers Academy's customer-facing command-line tool. Initializes tracking for use with [Hub](http://github.com/makersacademy/hub).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'makersinit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install makersinit

## Usage

- Navigate to a directory.
- Run `makersinit`.
- Continue to work as normal. All your commits will be tracked.

## Under the hood

This gem uses a git pre-push hook to push commit data to [Git Receiver](http://github.com/makersacademy/git_receiver), which then pushes well-formed data into a Firebase.

This data is then pushed across to [Hub](http://github.com/makersacademy/hub), which displays commit data, live, to coaches.

The average time between pushing a commit to being displayed on Hub is around 0.5 seconds.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec features` to run feature tests. Also, run `rspec spec` to run unit tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/makersinit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

