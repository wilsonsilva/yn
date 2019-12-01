# Encapsulates all the code of the gem in a meaningful namespace.
module Yn
  # Gracefully handles typos in the words +yes+ or +no+.
  class Lenient
    YES_MATCH_SCORE_THRESHOLD = 2
    NO_MATCH_SCORE_THRESHOLD = 1.25

    Y_MATCH = [
      [5, 0.25],
      [6, 0.25],
      [7, 0.25],
      ['t', 0.75],
      ['y', 1],
      ['u', 0.75],
      ['g', 0.25],
      ['h', 0.25],
      ['j', 0.25]
    ].to_h

    E_MATCH = [
      [2, 0.25],
      [3, 0.25],
      [4, 0.25],
      ['w', 0.75],
      ['e', 1],
      ['r', 0.75],
      ['s', 0.25],
      ['d', 0.25],
      ['f', 0.25]
    ].to_h

    S_MATCH = [
      ['q', 0.25],
      ['w', 0.25],
      ['e', 0.25],
      ['a', 0.75],
      ['s', 1],
      ['d', 0.75],
      ['z', 0.25],
      ['x', 0.25],
      ['c', 0.25]
    ].to_h

    N_MATCH = [
      ['h', 0.25],
      ['j', 0.25],
      ['k', 0.25],
      ['b', 0.75],
      ['n', 1],
      ['m', 0.75]
    ].to_h

    O_MATCH = [
      [9, 0.25],
      [0, 0.25],
      ['i', 0.75],
      ['o', 1],
      ['p', 0.75],
      ['k', 0.25],
      ['l', 0.25]
    ].to_h

    # Returns +true+ or +false+ if input resembles the words +yes+ or +no+ respectively,
    # or the given +default+ otherwise
    #
    # @param [String] input The string to compare with the words +yes+ or +no+
    # @param [Object] default Value returned when the +input+ doesn't resemble the words +yes+ or +no+
    #
    # @return [Object]
    #
    # @api private
    #
    def call(input, default)
      return true if get_yes_match_score(input) >= YES_MATCH_SCORE_THRESHOLD
      return false if get_no_match_score(input) >= NO_MATCH_SCORE_THRESHOLD

      default
    end

    private

    # Returns a match score with word +yes+ between 0 and 3
    #
    # @param [String] input The string to compare with the word +yes+
    #
    # @return [Fixnum|Float]
    #
    # @api private
    #
    def get_yes_match_score(input)
      y, e, s = input.split('')

      score = 0
      score += Y_MATCH.fetch(y) if Y_MATCH.key?(y)
      score += E_MATCH.fetch(e) if E_MATCH.key?(e)
      score += S_MATCH.fetch(s) if S_MATCH.key?(s)
      score
    end

    # Returns a match score with word +no+ between 0 and 2
    #
    # @param [String] input The string to compare with the word +no+
    #
    # @return [Fixnum|Float]
    #
    # @api private
    #
    def get_no_match_score(input)
      n, o = input.split('')

      score = 0
      score += N_MATCH.fetch(n) if N_MATCH.key?(n)
      score += O_MATCH.fetch(o) if O_MATCH.key?(o)
      score
    end
  end

  private_constant :Lenient
end
