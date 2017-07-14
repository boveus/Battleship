class Map
  def initialize
    wave = `echo "\xF0\x9F\x8C\x8A"`.strip
    @border = "===========\n"
    @line1 = ". 1 2 3 4 \n"
    @line2 = "A #{wave} #{wave} #{wave} #{wave}\n"
    @line3 = "B #{wave} #{wave} #{wave} #{wave}\n"
    @line4 = "C #{wave} #{wave} #{wave} #{wave}\n"
    @line5 = "D #{wave} #{wave} #{wave} #{wave}\n"
    @bottom_border = "==========="
    @map_display = @border + @line1 + @line2 + @line3 + @line4 + @line5 + @bottom_border
  end

  def display
    @map_display
  end
end
