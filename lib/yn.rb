require 'yn/version'
require 'yn/lenient'

# Encapsulates all the code of the gem in a meaningful namespace.
module Yn
  def self.parse(input, lenient: false, default: nil)
    input = input.to_s.strip

    unless [NilClass, TrueClass, FalseClass].include?(default.class)
      raise ArgumentError, "Expected the 'default' option to be nil or a boolean, got #{default.class}"
    end

    return true if /^(?:y|yes|true|1|on)$/i.match?(input)
    return false if /^(?:n|no|false|0|off)$/i.match?(input)

    return Lenient.new.call(input, default) if lenient == true

    default
  end
end
