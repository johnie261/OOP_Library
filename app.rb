require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'books'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # method to list all books
  def list_books
    return puts 'There are no books available' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  # method to list all people
  def list_people
    puts 'There ara no people' if @people.empty?

    @people.each { |person| puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}" }
  end

  # Method to create a person {teacher or student}
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)'
    input_num = gets.chomp.to_i

    case input_num
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  # method to create person {student}
  def create_student
    print 'Age:'
    age = gets.chomp.to_i

    print 'Name:'
    name = gets.chomp

    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp

    student = Student.new(age: age, name: name, parent_permission: parent_permission)
    @people << student

    puts 'Student created successfully'
  end

  # method to create person {teacher}
  def create_teacher
    print 'Age:'
    age = gets.chomp.to_i

    print 'Name:'
    name = gets.chomp

    print 'Specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(age: age, name: name, specialization: specialization)
    @people << teacher

    puts 'Teacher created successfully'
  end

  # method to create a book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Books.new(title, author)
    @books << book

    puts 'Book created successfully'
  end

  # method to create a rental
  def create_rental
    if @books.empty?
      puts 'There are no books in the records'
    elsif @people.empty?
      puts 'THere are no person in the records'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      rentals = Rental.new(date, @books[book_index], @people[person_index])
      @rentals << rentals

      puts 'Rental created successfully'
    end
  end

  # Method to list all rentals for a given person
  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts 'Rental'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
