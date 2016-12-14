#require gems so i can use them
require 'console_splash'
require 'colorize'

#enabling strings to be colorized
String.disable_colorization = false 

#creating splashscreen
splash = ConsoleSplash.new(30, 80)
#border
splash.write_horizontal_pattern("*")    
splash.write_vertical_pattern("*")   
#header, text
splash.write_center(10, "Welcome to Flood-it")
splash.write_center(14, "version 10.0")
splash.write_center(15, "by Zili Zhang")
splash.write_center(25, "<Press enter to continue>")
splash.splash



#method updating array elements with new colour
def neighbour_update(board,width,height,next_colour,i,j,count,first_block,finished_game_counter,current_score)
  if board[i][j] == first_block
    board[i].map!.with_index{|r,c| (c == j ? r = next_colour : r)}
    if i > 0 
      neighbour_update(board,width,height,next_colour,i-1,j,count,first_block,finished_game_counter,current_score)
    end
    if j > 0  
      neighbour_update(board,width,height,next_colour,i,j-1,count,first_block,finished_game_counter,current_score)
    end
    if i < height-1
      neighbour_update(board,width,height,next_colour,i+1,j,count,first_block,finished_game_counter,current_score)
    end
    if j < width-1 
      neighbour_update(board,width,height,next_colour,i,j+1,count,first_block,finished_game_counter,current_score)
    end
  end
  choose_colour(board,width,height,count,finished_game_counter,current_score)
end


def high_score(current_score,finished_game_counter)
  if finished_game_counter == 0
    puts "No games played yet"
  elsif
    puts "Best game: #{current_score} turns"
  end
end
  
#puts the number of turns the user took when called
def turns(count)
  puts count
end
 
#prints congratulation message when the game finishes
def congratulation(percentage,count,current_score,finished_game_counter,width,height)
  puts "You won after #{count} turns"
  again = gets
  if again == "\n"
    main_menu(width,height,current_score,finished_game_counter)
  end
end

#calculates the percentage completion 
def completion(board,width,height,count,finished_game_counter,current_score)
  #define individual counters for each colour
  counter_red = 0
  counter_green = 0
  counter_blue = 0
  counter_yellow = 0
  counter_magenta = 0
  counter_cyan = 0
  #iterate through array and add 1 to the counter of the colour
  board.each do |row|
    row.each do |column| 
      if column == :red
        counter_red += 1
      elsif column == :green
        counter_green += 1
      elsif column == :blue
        counter_blue += 1
      elsif column == :yellow
        counter_yellow += 1
      elsif column == :magenta
        counter_magenta += 1
      elsif column == :cyan
        counter_cyan += 1
      end    
    end
  end
  #calculates the percentage of the game completed depending on which colour is in the top left element
  if board[0][0] == :red
    percentage = (counter_red*100)/(width*height)
  elsif board[0][0] == :green
    percentage = (counter_green*100)/(width*height)
  elsif board[0][0] == :blue
    percentage = (counter_blue*100)/(width*height)
  elsif board[0][0] == :yellow
    percentage = (counter_yellow*100)/(width*height)
  elsif board[0][0] == :magenta
    percentage = (counter_magenta*100)/(width*height)
  elsif board[0][0] == :cyan
    percentage = (counter_cyan*100)/(width*height)
  end
  puts "#{percentage}%"
  if percentage == 100
    finished_game_counter += 1
    if finished_game_counter == 1
      current_score = count
      high_score(current_score,finished_game_counter)
    elsif finished_game_counter > 1
      if count < current_score
        current_score = count
        high_score(current_score,finished_game_counter)
      end
    end
    congratulation(percentage,count,current_score,finished_game_counter,width,height)
  end
end


  
  
#initialize neighbour_update method
def change_colour(board,user_colour,width,height,count,finished_game_counter,current_score)
  first_block = board[0][0]
  next_colour = user_colour
  neighbour_update(board,width,height,next_colour,0,0,count,first_block,finished_game_counter,current_score)
end

#takes user input (main)
def choose_colour(board,width,height,count,finished_game_counter,current_score)
  #prints the array
  board.each do |row|
    row.each do |column| 
      #the field is coloured according to the element in the array 
      if column == :red
        #prints the element as two space characters with a coloured background
        print column = "  ".colorize(:background => :red)
      elsif column == :green
        print column = "  ".colorize(:background => :green)
      elsif column == :blue
        print column = "  ".colorize(:background => :blue)
      elsif column == :yellow
        print column = "  ".colorize(:background => :yellow)
      elsif column == :magenta
        print column = "  ".colorize(:background => :magenta)
      elsif column == :cyan
        print column = "  ".colorize(:background => :cyan)
      end    
    end
    puts
  end
  print "Number of turns: "
  #calls turns method
  turns(count)
  print "Current completion: "
  #calls completion method
  completion(board,width,height,count,finished_game_counter,current_score)
  print "Choose a colour: "
  #gets user input r,g,y,b,c,m
  user_colour = gets.chomp.downcase
  count = count + 1
  #the user_colour variable will be set , depending on the user input
  if user_colour == "r"
    user_colour = :red
    #calls change_colour function
    change_colour(board,user_colour,width,height,count,finished_game_counter,current_score)
  elsif user_colour == "g"
    user_colour = :green
    change_colour(board,user_colour,width,height,count,finished_game_counter,current_score)
  elsif user_colour == "b"
    user_colour = :blue
    change_colour(board,user_colour,width,height,count,finished_game_counter,current_score)
  elsif user_colour == "y"
    user_colour = :yellow
    change_colour(board,user_colour,width,height,count,finished_game_counter,current_score)
  elsif user_colour == "m"
    user_colour = :magenta
    change_colour(board,user_colour,width,height,count,finished_game_counter,current_score)
  elsif user_colour == "c"
    user_colour = :cyan
    change_colour(board,user_colour,width,height,count,finished_game_counter,current_score)
    #if user types q, he will return to the main menu
  elsif user_colour == "q"
    main_menu(width,height,current_score,finished_game_counter)
  end
end

#creates 2d array, elements consists of 2 space characters coloured depending on the number
def get_board(width,height,finished_game_counter,current_score)
  board = Array.new(height) { Array.new(width, 0)}
  (0..(height-1)).each do |row|
    (0..(width-1)).each do |column| 
      #generate a random number between 1 and 6 inclusive, in order to create an array
      #of randomly coloured fields
      array_element = rand(1..6)
      #allocates a number to each colour
      if array_element == 1 
        board[row][column] = :red
      elsif array_element == 2
        board[row][column] = :green
      elsif array_element == 3
        board[row][column] = :blue
      elsif array_element == 4
        board[row][column] = :yellow
      elsif array_element == 5
        board[row][column] = :magenta
      elsif array_element == 6
        board[row][column] = :cyan
      end
    end
  end
  #sets count to 0
  count = 0
  choose_colour(board,width,height,count,finished_game_counter,current_score)
end

#changes the size of the array depending on user inputs
def change(width,height,current_score,finished_game_counter)
  print "Width (Currently #{width})? "
  #gets input from user
  width = gets.chomp.to_i
  print "Height (Currently #{height})? "
  height = gets.chomp.to_i
  main_menu(width,height,current_score,finished_game_counter)
end

#main menu 
def main_menu(width,height,current_score,finished_game_counter)
  puts "\n"
  puts "Main menu:"
  puts "s = Start game"
  puts "c = Change size"
  puts "q = Quit"
  high_score(current_score,finished_game_counter)
  print "Please enter your choice: "
  input = gets.chomp.downcase
  if input == "c"
    change(width,height,current_score,finished_game_counter)
  elsif input == "s"
    get_board(width,height,finished_game_counter,current_score)
  elsif input == "q"
    exit
  end
end
#starts program by waiting for user to press enter key
init = gets
current_score = 0
finished_game_counter = 0
#checks if enter key is pressed
if init == "\n"
  main_menu(14,9,current_score,finished_game_counter)
end

      

  

















