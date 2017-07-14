class Map
  def initialize
    @border = "===========\n"
    @line1 = ". 1 2 3 4 \n"
    @line2 = "A\n"
    @line3 = "B\n"
    @line4 = "C\n"
    @line5 = "D\n"
    @bottom_border = "==========="
    @map_display = @border + @line1 + @line2 + @line3 + @line4 + @line5 + @bottom_border
  end

  def display
    @map_display
  end
end
