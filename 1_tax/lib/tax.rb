class Tax
  def calc(price_list)
    (price_list.sum * 1.1).round
  end
end
