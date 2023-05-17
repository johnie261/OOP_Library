require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      display_menu
      option = gets.chomp.to_i

      handle_option(option)
      break if option == 7

      puts ' '
    end
    puts 'Thank you for using this app!'
  end

  private

  def display_menu
    puts "\nPlease choose an option by entering a number:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Exit'
  end

  def handle_option(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    else
      puts 'That is not a valid option'
    end
  end
end

main = Main.new
main.run
