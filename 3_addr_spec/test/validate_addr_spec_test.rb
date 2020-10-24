# coding: utf-8
require 'minitest/autorun'
require "stringio"
require_relative '../../test_helper.rb'
require_relative '../lib/validate_addr_spec.rb'

class ValidateAddrSpecTest < Minitest::Test
  def setup
    @vas = ValidateAddrSpec.new
  end

  def test_validate
    stdin = StringIO.new  <<EOF
abc@example.com
a..bc@example.com
EOF
    stdout = StringIO.new("", 'w+')
    expects = "ok\nng\n"
    @vas.validate_addr_spec(stdin, stdout)
    assert_equal expects, stdout.string
  end
end

