# Author, Book, BookType, Address

BookGenre.delete_all
Author.delete_all

book_genres = [
  {genre: 'novel'},
  {genre: 'short story'},
  {genre: 'play'},
  {genre: 'poems'},
  {genre: 'non-fiction'}
]

authors = [
  {first_name: "Bob", last_name: "Cobb", birth_year: 1974}, 
  {first_name: "Abe", last_name: "Area", birth_year: 1963},
  {first_name: "Kal", last_name: "Kool", birth_year: 1978},
  {first_name: "Mel", last_name: "Mope", birth_year: 1997},
  {first_name: "Vin", last_name: "Vine", birth_year: 1984},
  {first_name: "Sal", last_name: "Soap", birth_year: 1986},
  {first_name: "Ned", last_name: "Nail", birth_year: 1993},
  {first_name: "Gil", last_name: "Goat", birth_year: 1977},
  {first_name: "Jim", last_name: "Jupe", birth_year: 2000},
  {first_name: "Don", last_name: "Dome", birth_year: 1989}
]

book_genres.each do |genre|
  BookGenre.create(genre)
end

authors.each do |author|
  Author.create(author)
end