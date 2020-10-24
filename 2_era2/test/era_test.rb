# coding: utf-8
require 'minitest/autorun'
require_relative '../../test_helper.rb'
require_relative '../lib/convert_era.rb'

class EraTest < Minitest::Test
  def setup
    @era = Era.new
  end

  def test_calc_reiwa
    assert_equal "令和元年", @era.calc(2019, 10, 24)
    assert_equal "令和2年", @era.calc(2020, 10, 24)
    assert_equal "令和82年", @era.calc(2100, 10, 24)
  end

  def test_calc_heisei
    assert_equal "平成元年", @era.calc(1989, 1, 8)
    assert_equal "平成10年", @era.calc(1998, 3, 17)
    assert_equal "平成31年", @era.calc(2019, 4, 30)
  end

  def test_calc_showa
    assert_equal "昭和元年", @era.calc(1926, 12, 25)
    assert_equal "昭和3年", @era.calc(1928, 12, 25)
    assert_equal "昭和64年", @era.calc(1989, 1, 7)
  end

  def test_calc_hanigai
    # 1926/12/24以前は例外出すこと
    assert_raises ArgumentError do
      @era.calc(1926, 12, 24)
    end
  end
end
