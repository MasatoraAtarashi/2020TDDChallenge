# coding: utf-8
require 'minitest/autorun'
require "stringio"
require_relative '../../test_helper.rb'
require_relative '../lib/validate_addr_spec.rb'

class ValidateAddrSpecTest < Minitest::Test
  def setup
    @vas = ValidateAddrSpec.new
  end

  # ドメイン部
  # 1
  #   def test_validate_domain_1
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # abc@exあmple.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  #   # 2
  #   def test_validate_domain_2
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # abc@.example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  #   # 3
  #   def test_validate_domain_3
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # abc@example.com.
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #   # 4
  #   def test_validate_domain_4
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # abc@example..com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  #   # 5
  #   def test_validate_domain_5
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # a..bc@
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  #   # @
  #   def test_validate_a_mark_1
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # abcexample.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  #   def test_validate_a_mark_2
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # abc@@example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  #
  # #   # ローカル部
  # #   def test_validate_local
  # #     # TODO: ドットアトム部またはクオーテッド文字列部のどちらかである
  # #     stdin = StringIO.new  <<EOF
  # #
  # # EOF
  # #     stdout = StringIO.new("", 'w+')
  # #     expects = "ok\nng\n"
  # #     @vas.validate_addr_spec(stdin, stdout)
  # #     assert_equal expects, stdout.string
  # #   end
  #
  # #   # ドットアトム
  # #   # 1
  #   def test_validate_local_dot_atom_1
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # ドットアトム@example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  # #   # 2
  #   def test_validate_local_dot_atom_2
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # .abc@example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  # #   # 3
  #   def test_validate_local_dot_atom_3
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # abc.@example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  # #   # 4
  #   def test_validate_local_dot_atom_4
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # a..bc@example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #
  # #   # 5
  #   def test_validate_local_dot_atom_5
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # @example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end

  #   # クオーテッド
  #   # 1
  #   def test_validate_local_quated_1
  #     stdin = StringIO.new  <<EOF
  # "abc"@example.com
  # "abc@example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end

  #   # 2
  #   def test_validate_local_quated_2
  #     stdin = StringIO.new  <<EOF
  # "abc"@example.com
  # abc"@example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #   # 3
#   def test_validate_local_quated_3
#     stdin = StringIO.new  <<EOF
# "abc2!#$%&'*+-/=?^_`{|}~(),.:;<>@[]"\"@example.com
# a..bc@example.com
# EOF
#     stdout = StringIO.new("", 'w+')
#     expects = "ok\nng\n"
#     @vas.validate_addr_spec(stdin, stdout)
#     assert_equal expects, stdout.string
#   end
  #   # 4
  #   def test_validate_local_quated_4
  #     stdin = StringIO.new  <<EOF
  # abc@example.com
  # a..bc@example.com
  # EOF
  #     stdout = StringIO.new("", 'w+')
  #     expects = "ok\nng\n"
  #     @vas.validate_addr_spec(stdin, stdout)
  #     assert_equal expects, stdout.string
  #   end
  #   # 5
  def test_validate_local_quated_5
    stdin = StringIO.new  <<EOF
""@example.com
example.com
EOF
    stdout = StringIO.new("", 'w+')
    expects = "ok\nng"
    @vas.validate_addr_spec(stdin, stdout)
    assert_equal expects, stdout.string
  end
# end

