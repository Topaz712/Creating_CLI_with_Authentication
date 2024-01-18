require_relative './api.rb'
require_relative "./user.rb"

class CLI
  def run
    system('clear')
    greet
    User.load_users_from_file
    authenticate
    while menu != 'exit'
    end
    goodbye
  end

  def greet
    puts 'Welcome to The National Hockey League CLI'
  end

  def menu
    puts "\nPlease enter a year from 1990 to 2011 to see the National Hockey League teams from that year: \n\n"
    puts "Type 'exit' to quit.\n\n"

    input_year = gets.chomp
    if input_year == 'exit'
      goodbye(input_year)
    else
      find_team_by_year(input_year)
      input_year
    end
  end

  def find_team_by_year(input_year)
    puts "\n Looking for the Hockey Teams for the year #{input_year}... \n\n"
    API.find_team_by_year(input_year)
  end

  def goodbye(input_year)
    puts 'Goodbye, Have a great day!'
    exit if input_year == 'exit'
  end

  def authenticate
    authenticated = false

    until authenticated 
      puts "Please login or sign up"
      puts "Which would you like to do?(sign up/login)"

      user_input = gets.chomp
      
      if user_input == 'login'
        authenticated = login
      else
        create_new_account
      end
    end
  end

  def login
    puts "Please enter your username: "
    username = gets.chomp
    puts "Please enter your password: "
    password = gets.chomp
    result = User.authenticate(username, password)

    if result
      puts "Welcome back #{username}!"
    else
      puts "Sorry, your username or password is incorrect. Please try again."
    end
    result
  end

  def create_new_account
    puts "Please enter your username: "
    username = gets.chomp
    puts "Please enter your password: "
    password = gets.chomp

    user = User.new(username, password, false)
    User.store_credentials(user)
    puts "Account created! Welcome #{username}!"
  end
  
end
