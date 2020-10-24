class Tax
  def calc(price_list)
    (price_list.sum * 1.1).floor
  end
end
