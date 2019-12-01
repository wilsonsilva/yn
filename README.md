# Yn

[![Gem Version](https://badge.fury.io/rb/yn.svg)](https://badge.fury.io/rb/yn)
[![Build Status](https://travis-ci.org/wilsonsilva/yn.svg?branch=master)](https://travis-ci.org/wilsonsilva/yn)
[![Security](https://hakiri.io/github/wilsonsilva/yn/master.svg)](https://hakiri.io/github/wilsonsilva/yn/master)
[![Inline docs](http://inch-ci.org/github/wilsonsilva/yn.svg?branch=master)](http://inch-ci.org/github/wilsonsilva/yn)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/yn`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yn'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yn

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies, configure git hooks and create support files.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The health and maintainability of the codebase is ensured through a set of
Rake tasks to test, lint and audit the gem for security vulnerabilities and documentation:

```
rake bundle:audit          # Checks for vulnerable versions of gems 
rake qa                    # Test, lint and perform security and documentation audits
rake rubocop               # Lint the codebase with RuboCop
rake rubocop:auto_correct  # Auto-correct RuboCop offenses
rake spec                  # Run RSpec code examples
rake verify_measurements   # Verify that yardstick coverage is at least 100%
rake yard                  # Generate YARD Documentation
rake yard:junk             # Check the junk in your YARD Documentation
rake yardstick_measure     # Measure docs in lib/**/*.rb with yardstick
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/yn. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Yn project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/yn/blob/master/CODE_OF_CONDUCT.md).
