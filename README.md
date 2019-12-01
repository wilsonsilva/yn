# Yn

[![Gem Version](https://badge.fury.io/rb/yn.svg)](https://badge.fury.io/rb/yn)
[![Build Status](https://travis-ci.org/wilsonsilva/yn.svg?branch=master)](https://travis-ci.org/wilsonsilva/yn)
[![Security](https://hakiri.io/github/wilsonsilva/yn/master.svg)](https://hakiri.io/github/wilsonsilva/yn/master)
[![Inline docs](http://inch-ci.org/github/wilsonsilva/yn.svg?branch=master)](http://inch-ci.org/github/wilsonsilva/yn)


> Parse yes/no like values

Useful for validating answers of a CLI prompt.

---

The following case-insensitive values are recognized:

```ruby
'y', 'yes', 'true', true, '1', 1, 'n', 'no', 'false', false, '0', 0, 'on', 'off'
```

*Enable lenient mode to gracefully handle typos.*

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

```ruby
require 'yn'

Yn('y')
# => true

Yn('NO')
# => false

Yn(true)
# => true

Yn('abomasum')
# => nil

Yn('abomasum', default: false)
# => false

Yn('mo', lenient: true)
# => false
```

Unrecognized values return `nil`.

## API

### Yn(input, options?)

#### input

Type: `unknown`

Value that should be converted.

#### options

Type: `hash`

##### lenient

Type: `boolean`\
Default: `false`

Use a key distance-based score to leniently accept typos of `yes` and `no`.

##### default

Type: `boolean`\
Default: `nil`

Default value if no match was found.

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

Bug reports and pull requests are welcome on GitHub at https://github.com/wilsonsilva/yn.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Yn project’s codebases, issue trackers, chat rooms and mailing lists
is expected to follow the [code of conduct](https://github.com/wilsonsilva/yn/blob/master/CODE_OF_CONDUCT.md).
