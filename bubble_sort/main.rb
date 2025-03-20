require_relative './lib/bubble_sort.rb'

flag = false
while !flag
  system "clear"
  puts "Enter a list of numbers to be sorted, separated by spaces."
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

BubbleSort.new.sort(nums)

