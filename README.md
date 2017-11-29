# Beryl

[![Build Status](https://img.shields.io/travis/nomadium/beryl.svg)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nomadium/beryl.svg)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nomadium/beryl.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/nomadium/beryl.svg)][coveralls]

[travis]: https://travis-ci.org/nomadium/beryl
[gemnasium]: https://gemnasium.com/nomadium/beryl
[codeclimate]: https://codeclimate.com/github/nomadium/beryl
[coveralls]: https://coveralls.io/r/nomadium/beryl

Beryl is a Smalltalk implementation on top of JRuby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'beryl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beryl

## Usage

Just run beryl with your program:

```sh
$ bundle exec bin/beryl -e "Transcript show: 'Hello'"
```

The example is that trivial because Beryl is in a pre-alpha state
and the only implemented features are: to put integers in the stack,
sums and to print strings to stdout.

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag
for the version, push git commits and tags, and push the `.gem`
file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/nomadium/beryl. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org)
code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Beryl project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/nomadium/beryl/blob/master/CODE_OF_CONDUCT.md).

## References

This work is inspired by:

* [Reak](https://github.com/rkh/Reak) (Smalltalk on Rubinius) by Konstantin Haase.

* [Redline Smalltalk](http://www.redline.st/) (Smalltalk on the JVM) by James Ladd.

* [JRuby](https://github.com/jruby/jruby) (Ruby implementation on the JVM)
  by Charles Nutter, Thomas Enebo, et al.
