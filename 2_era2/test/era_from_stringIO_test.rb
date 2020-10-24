# coding: utf-8
require 'minitest/autorun'
require "stringio"
require_relative '../../test_helper.rb'
require_relative '../lib/era.rb'

class CliTest < Minitest::Test
  def setup
    @era = Era.new
  end

  def test_calc_showa
    stdin = StringIO.new  <<EOF
1926/12/25
1928/12/25
1989/1/7
EOF
    stdout = StringIO.new("", 'w+')
    expects = "昭和元年\n昭和3年\n昭和64年\n"
    @era.convert_from_std(stdin, stdout)
    assert_equal expects, stdout.string
  end

  def test_calc_heisei
    stdin = StringIO.new  <<EOF
1989/1/8
1998/3/17
2019/4/30
EOF
    stdout = StringIO.new("", 'w+')
    expects = "平成元年\n平成10年\n平成31年\n"
    @era.convert_from_std(stdin, stdout)
    assert_equal expects, stdout.string
  end

  def test_calc_reiwa
    stdin = StringIO.new  <<EOF
2019/5/1
2020/10/24
2100/10/24
EOF
    stdout = StringIO.new("", 'w+')
    expects = "令和元年\n令和2年\n令和82年\n"
    @era.convert_from_std(stdin, stdout)
    assert_equal expects, stdout.string
  end

  # 空行
  # パースできないyつ
  def test_invalid_inputs
    stdin = StringIO.new  <<EOF
1999

2020 10 24
hoge/hoge/hoge
EOF
    stdout = StringIO.new("", 'w+')
    expects = "error\n" * 4
    @era.convert_from_std(stdin, stdout)
    assert_equal expects, stdout.string
  end

end
