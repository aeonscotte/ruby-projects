class StockPicker
  def process_prices(prices)
    days = []
    abs_max_profit = 0
    for i in 0..prices.length-1 do
      purchase_price = prices[i]
      rel_max_profit = 0
      for j in i+1..prices.length-1 do
        profit = prices[j] - purchase_price
        rel_max_profit = profit > rel_max_profit ? profit : rel_max_profit
        if rel_max_profit > abs_max_profit
          days[0] = i + 1
          days[1] = j + 1
          abs_max_profit = rel_max_profit
        end
      end
    end
    puts "\nBuy on day #{days[0]} and sell on day #{days[1]} for a maximum profit of $#{abs_max_profit}.\n\n"
    days
  end
end
