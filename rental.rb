class Rental
  attr_accessor :date, :book

  def initialize(date)
    @date = date

    @book = book
    @person = person

    # Establishes the belongs-to association: a rental belongs to a book
    book.add_rental(self)

    # Establishes the belongs-to association: a rental belongs to a person
    person.add_rental(self)
  end
end
