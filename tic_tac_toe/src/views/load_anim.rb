require_relative './vista'

class LoadAnimation
  def initialize
    @tic = [" dBBBBBBP dBP dBBBP        ",
            "                           ",
            "  dBP   dBP dBP            ",
            " dBP   dBP dBP             ",
            "dBP   dBP dBBBBP           ",]
    @tac = [" dBBBBBBP dBBBBBb     dBBBP",
            "               BB          ",
            "  dBP      dBP BB   dBP    ",
            " dBP      dBP  BB  dBP     ",
            "dBP      dBBBBBBB dBBBBP   "]
    @toe = [" dBBBBBBP dBBBBP dBBBP     ",
            "         dBP.BP            ",
            "  dBP   dBP.BP dBBP        ",
            " dBP   dBP.BP dBP          ",
            "dBP   dBBBBP dBBBBP        "]
    @rot = ["-",
            "/",
            "|",
            "\\"]
  end

  def banner
    v = Vista.new(27, 5, 3, 1)
    system "clear"
    sleep(0.5)
    [@tic, @tac, @toe].each do |word|
      v.top.each do |line|
        puts line.join
      end
      for i in 0..v.height - 1
        print v.left[i].join
        unless i > word.length
          print word[i]
        end
        print v.right[i].join
        print " \n"
      end
      v.bottom.each do |line|
        puts line.join
      end
      sleep(0.7)
      system "clear"
    end
  end

  def rot(text)
    for i in 0..5
      @rot.each do |spinner|
        puts text + " " + spinner
        sleep(0.1)
        system "clear"
      end
    end
  end
end
