class Vista 
  attr_reader :width, :height, :padding_width, :padding_height, :top, :left, :right, :bottom
  def initialize(width, height, padding_width, padding_height)
    @width = width
    @height = height
    @padding_width = padding_width
    @padding_height = padding_height
    @top = gen_top
    @left = gen_left
    @right = gen_right
    @bottom = gen_bottom 
  end

  def gen_top
    top = Array.new(@padding_height + 1) {Array.new(@padding_width + @width + @padding_width + 2, ' ')}
    top.each_with_index do |row, i| 
      top[i][0] = '│' 
      top[i][top[i].length - 1] = '│' 
    end
    top[0].each_with_index do |row, i| 
      top[0][i] = '─'
    end 
    top[0][0] = '┌' 
    top[0][top[0].length - 1] = '┐'
    top
  end
  
  def gen_left
    left = Array.new(@height) {Array.new(@padding_width + 1, ' ')}
    left.each_with_index do |row, i|
      left[i][0] = '│'
    end
  end
  
  def gen_right
    right = Array.new(@height) {Array.new(@padding_width + 1, ' ')}
    right.each_with_index do |row, i|
      right[i][right[i].length - 1] = '│'
    end   
  end
  
  def gen_bottom
    bot = Array.new(@padding_height + 1) {Array.new(@padding_width + @width + @padding_width + 2, ' ')}
    bot.each_with_index do |row, i| 
      bot[i][0] = '│' 
      bot[i][bot[i].length - 1] = '│' 
    end
    bot[0].each_with_index do |row, i| 
      bot[bot.length - 1][i] = '─'
    end 
    bot[bot.length - 1][0] = '└' 
    bot[bot.length - 1][bot[0].length - 1] = '┘'
    bot 
  end

  def print_blank
    # print TOP
    @top.each do |line|
      puts line.join
    end
    # print SIDES
    for i in 0..@height - 1
      puts @left[i].join + (" " * @width) + @right[i].join
    end
    # print BOTTOM
    @bottom.each do |line|
      puts line.join
    end
  end
end
