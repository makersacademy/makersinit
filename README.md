# `makersinit`

Makers Academy's customer-facing command-line tool. 

Tracks student git commits in [Hub](https://hub.makersacademy.com).

## How to use makersinit to track your Git commits

    $ gem install makersinit

Navigate into a repo on your computer that you're working on.  You'll need to do this for each repo you work on.

    $ makersinit
    
## How makersinit works under the hood (if you're curious)

This gem uses a git pre-push hook to push commit data to [Git Receiver](http://github.com/makersacademy/git_receiver), which then pushes well-formed data into a Firebase.

This data is then pushed across to [Hub](https://hub.makersacademy.com), which displays commit data, live, to coaches.

The average time between pushing a commit to being displayed on Hub is around 0.5 seconds.

## How to do development on the makersinit gem code itself (no need to do this if you just want to use the gem)

### Installation

Navigate to the cloned directory, then:

```sh
gem install `pwd`/makersinit-1.0.0.gem
```

(if the current version of the gem is 1.0.0).

### Setup

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec features` to run feature tests. Also, run `rspec spec` to run unit tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/makersinit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

