require 'console_splash'
splash = ConsoleSplash.new(30, 80)
splash.write_horizontal_pattern("*")
splash.write_vertical_pattern("*")
splash.write_center(10, "Welcome to Flood-it")
splash.write_center(14, "version 10.0")
splash.write_center(15, "by Zili Zhang")
splash.write_center(25, "<Press enter to continue>")
splash.splash



def selection
  input = gets.chomp
  if input == "c"
    print "Width (Currently 14)? "
    width = gets.chomp
    print "Height (Currently 9)? "
    height = gets.chomp
  else input == "q"
    exit
  end
end

def haupt_menu
  init = gets
  if init == "\n"
    puts "\n"
    puts "Main menu:"
    puts "s = Start game"
    puts "c = Change size"
    puts "q = Quit"
    #best score achieved
    #enter choice
    selection
  end
end
haupt_menu






def get_board(width, height)
  # TODO: Implement this method
  #
  # This method should return a two-dimensional array.
  # Each element of the array should be one of the
  # following values (These are "symbols", you can use
  # them like constant values):
  # :red
  # :blue
  # :green
  # :yellow
  # :cyan
  # :magenta
  #
  # It is important that this method is used because
  # this will be used for checking the functionality
  # of your implementation.
end

# TODO: Implement everything else as described in the
#       assignment brief.
