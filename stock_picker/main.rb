require_relative './lib/stock_picker'

flag = false
while !flag
  system "clear"
  puts "Enter a list of prices to analyze, separated by spaces."
  nums = gets.chomp
  flag = nums.match /^( *\d+ *)+$/
  if !flag 
    puts "Invalid input!"
    sleep(1)
  end
end

nums = nums.split(' ')

nums.each_with_index do |num, i|
  nums[i] = nums[i].to_i
end

StockPicker.new.process_prices(nums)

