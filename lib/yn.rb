# typed: strict
require 'sorbet-runtime'
require 'yn/version'
require 'yn/lenient'

# Encapsulates all the code of the gem in a meaningful namespace.
module Yn
  extend T::Sig

  # Parses yes/no like values
  #
  # @example Parsing yes-like values
  #   Yn.parse('y') # => true
  #   Yn.parse('yes') # => true
  #   Yn.parse('Yes') # => true
  #   Yn.parse('YES') # => true
  #   Yn.parse('1') # => true
  #   Yn.parse(1) # => true
  #   Yn.parse('on') # => true
  #   Yn.parse('true') # => true
  #   Yn.parse(true) # => true
  #
  # @example Parsing no-like values
  #   Yn.parse('n') # => false
  #   Yn.parse('no') # => false
  #   Yn.parse('No') # => false
  #   Yn.parse('NO') # => false
  #   Yn.parse('0') # => false
  #   Yn.parse(0) # => false
  #   Yn.parse('off') # => false
  #   Yn.parse('false') # => false
  #   Yn.parse(false) # => false
  #
  # @example Allowing typos in the words yes or no
  #   Yn.parse('y7s', lenient: true) # => true
  #   Yn.parse('tes', lenient: true) # => true
  #   Yn.parse('yes', lenient: true) # => true
  #   Yn.parse('mo', lenient: true) # => false
  #   Yn.parse('nl', lenient: true) # => false
  #   Yn.parse('no', lenient: true) # => false
  #   Yn.parse('something-else', lenient: true) # => nil
  #
  # @example Using a default value
  #   Yn.parse('falso', default: false) # => false
  #   Yn.parse('verdadeiro', default: true) # => true
  #
  # @param [Object] input The input object or string to be converted
  # @param [Object] lenient Whether typos in words +yes+ and +no+ are allowed or not
  # @param [Object] default Value returned when the +input+ isn't considered +yes+ or +no+
  #
  # @return [Boolean|nil] +true+ if the input is a yes-like value, +false+ if the input is a no-like value
  # and +nil+ or +default+ otherwise.
  #
  # @api public
  #
  sig { params(input: Object, lenient: T::Boolean, default: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
  def self.parse(input, lenient: false, default: nil)
    input = input.to_s.strip

    return true if /^(?:y|yes|true|1|on)$/i.match?(input)
    return false if /^(?:n|no|false|0|off)$/i.match?(input)

    return Lenient.new.call(input, default) if lenient == true

    default
  end
end
