# coding: utf-8
require 'minitest/autorun'
require_relative '../../test_helper.rb'
require_relative '../lib/convert_era.rb'

class CliTest < Minitest::Test
  def setup
    @era = Era.new
  end

  def test_calc_reiwa
    assert_equal ["令和2年", "令和82年"], @era.convert_lines(["2020/10/24", "2100/10/24"])
  end

  def test_calc_heisei
    inputs = ["1989/1/8", "1998/3/17", "2019/4/30"]
    expects = ["平成元年", "平成10年", "平成31年"]
    assert_equal expects, @era.convert_lines(inputs)
  end

  def test_calc_showa
    inputs = ["1926/12/25", "1928/12/25", "1989/1/7"]
    expects = ["昭和元年", "昭和3年", "昭和64年"]
    assert_equal expects, @era.convert_lines(inputs)
  end

  def test_calc_hanigai
    # 1926/12/24以前, 空行，パースできない文字列は "error" を返すこと
    inputs = ["1926/12/24", "", "やっほー"]
    expects = ["error"]* inputs.length
    assert_equal expects, @era.convert_lines(inputs)
  end
end
