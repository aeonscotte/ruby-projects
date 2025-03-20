require_relative 'lib/caesar'

while true
  system "clear"
  puts "Enter the key you would like to use for your cipher."
  rot = gets.chomp
  if rot.match /^\d+$/
    system "clear"
    rot = rot.to_i
    break
  end
  puts "Invalid input!"
  sleep(0.5)
end

while true
  puts "Enter some text you would like to encode."
  text = gets.chomp
  puts CaesarCipher.new.encode(text, rot)
  puts "\n"
end
