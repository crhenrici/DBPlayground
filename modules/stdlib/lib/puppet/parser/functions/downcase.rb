#
#  downcase.rb
#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
#
module Puppet::Parser::Functions
  newfunction(:downcase, :type => :rvalue, :doc => <<-DOC
    @summary
      **Deprecated:** Converts the case of a string or all strings in an array to lower case.

    > *Note:* **Deprecated** from Puppet 6.0.0, this function has been replaced with a
    built-in [`downcase`](https://puppet.com/docs/puppet/latest/function.html#downcase) function.
    >
    This function is an implementation of a Ruby class and might not be UTF8 compatible.
    To ensure compatibility, use this function with Ruby 2.4.0 or greater.

    @return [String] The converted String, if it was a String that was given
    @return [Array[String]] The converted Array, if it was a Array that was given
  DOC
             ) do |arguments|

    raise(Puppet::ParseError, "downcase(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'downcase(): Requires either array or string to work with')
    end

    result = if value.is_a?(Array)
               # Numbers in Puppet are often string-encoded which is troublesome ...
               value.map { |i| i.is_a?(String) ? i.downcase : i }
             else
               value.downcase
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
