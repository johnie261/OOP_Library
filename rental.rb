class Rental
  attr_accessor :date, :book, :person

  def initialize(date)
    @date = date

    # Establishes the belongs-to association: a rental belongs to a book
    @book = book
    book.add_rental(self)

    # Establishes the belongs-to association: a rental belongs to a person
    @person = person
    person.add_rental(self)
  end
end
