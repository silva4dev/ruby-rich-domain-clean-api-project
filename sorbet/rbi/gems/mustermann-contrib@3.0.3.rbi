# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `mustermann-contrib` gem.
# Please instead update this file by running `bin/tapioca gem mustermann-contrib`.


# source://mustermann-contrib//lib/mustermann/versions.rb#2
module Mustermann
  class << self
    # source://mustermann/3.0.3/lib/mustermann.rb#89
    def [](name); end

    # source://mustermann/3.0.3/lib/mustermann.rb#120
    def extend_object(object); end

    # source://mustermann/3.0.3/lib/mustermann.rb#62
    def new(*input, type: T.unsafe(nil), operator: T.unsafe(nil), **options); end

    # source://mustermann/3.0.3/lib/mustermann.rb#115
    def normalized_type(type); end

    # source://mustermann/3.0.3/lib/mustermann.rb#110
    def register(name, type); end

    # source://mustermann/3.0.3/lib/mustermann.rb#101
    def try_require(path); end
  end
end

# Rails style pattern implementation.
#
# @example
#   Mustermann.new('/:foo', type: :rails) === '/bar' # => true
# @see Mustermann::Pattern
# @see file:README.md#rails Syntax description in the README
#
# source://mustermann-contrib//lib/mustermann/rails.rb#14
class Mustermann::Rails < ::Mustermann::AST::Pattern
  extend ::Mustermann::Versions
end

# source://mustermann-contrib//lib/mustermann/rails.rb#0
class Mustermann::Rails::Parser < ::Mustermann::AST::Parser; end

# Mixin that adds support for multiple versions of the same type.
#
# @see Mustermann::Rails
#
# source://mustermann-contrib//lib/mustermann/versions.rb#6
module Mustermann::Versions
  # Resolve a subclass for a given version string.
  #
  # @raise [ArgumentError]
  #
  # source://mustermann-contrib//lib/mustermann/versions.rb#30
  def [](version); end

  # source://mustermann-contrib//lib/mustermann/versions.rb#43
  def inspect; end

  # source://mustermann-contrib//lib/mustermann/versions.rb#38
  def name; end

  # Checks if class has mulitple versions available and picks one that matches the version option.
  #
  # source://mustermann-contrib//lib/mustermann/versions.rb#9
  def new(*args, version: T.unsafe(nil), **options); end

  # Defines a new version.
  #
  # source://mustermann-contrib//lib/mustermann/versions.rb#22
  def version(*list, inherit_from: T.unsafe(nil), &block); end

  # @return [Hash] version to subclass mapping.
  #
  # source://mustermann-contrib//lib/mustermann/versions.rb#16
  def versions; end
end