require 'minitest/autorun'
require_relative '../../test_helper.rb'
require_relative '../lib/tax.rb'

class TaxTest < Minitest::Test
  def setup
    @tax = Tax.new
  end

  def test_calc
    assert_equal 24, @tax.calc([10, 12])
    assert_equal 62, @tax.calc([40, 16])
    assert_equal 160, @tax.calc([100, 45])
    assert_equal 171, @tax.calc([50, 50, 55])
    assert_equal 0, @tax.calc([])
  end
end
