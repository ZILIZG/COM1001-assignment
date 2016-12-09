require 'console_splash'
require 'colorize'

String.disable_colorization = false
splash = ConsoleSplash.new(30, 80)
splash.write_horizontal_pattern("*")
splash.write_vertical_pattern("*")
splash.write_center(10, "Welcome to Flood-it")
splash.write_center(14, "version 10.0")
splash.write_center(15, "by Zili Zhang")
splash.write_center(25, "<Press enter to continue>")
splash.splash

def get_board(width,height)
  board = Array.new(height) { Array.new(width, 0)}
  (0..(height-1)).each do |row|
    (0..(width-1)).each do |column| 
      colour_number = rand(1..6)
      if colour_number == 1 
        board[row][column] = "  ".colorize(:background => :red)
      elsif colour_number == 2
        board[row][column] = "  ".colorize(:background => :green)
      elsif colour_number == 3
        board[row][column] = "  ".colorize(:background => :blue)
      elsif colour_number == 4
        board[row][column] = "  ".colorize(:background => :yellow)
      elsif colour_number == 5
        board[row][column] = "  ".colorize(:background => :magenta)
      elsif colour_number == 6
        board[row][column] = "  ".colorize(:background => :cyan)
      end
    end
  end
  board.each do |row|
    row.each do |column| 
      print column
    end
    puts
  end
end
  
def change(width,height)
  print "Width (Currently #{width})? "
  width = gets.chomp.to_i
  print "Height (Currently #{height})? "
  height = gets.chomp.to_i
  haupt_menu(width,height)
end

def haupt_menu(width,height)
  init = gets
  if init == "\n"
    puts "\n"
    puts "Main menu:"
    puts "s = Start game"
    puts "c = Change size"
    puts "q = Quit"
    print "Please enter your choice: "
    input = gets.chomp
  end
  if input == "c"
    change(width,height)
  elsif input == "s"
    get_board(width,height)
  elsif input == "q"
    exit
  end
end
haupt_menu(14,9)








# TODO: Implement everything else as described in the
#       assignment brief.
