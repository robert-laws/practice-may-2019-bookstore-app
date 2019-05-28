# Database Tables - Authors, Books, BookGenres, Shops, BookShops, Addresses
Address.delete_all
BookShop.delete_all
Book.delete_all
Shop.delete_all
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

books = [
  {title: "Book of Fun", publication_year: 2012, description: "interesting title", price: 20.45},
  {title: "New Things Happened", publication_year: 1985, description: "Good idea, but poor execution of the theme", price: 19.40},
  {title: "Golf Time in the Rain", publication_year: 1999, description: "Important new addition to the topic", price: 9.95},
  {title: "Reading with Cookies", publication_year: 2011, description: "interesting reflection on issues of the day", price: 18.25},
  {title: "Train to Town", publication_year: 1995, description: "interesting title", price: 33.50},
  {title: "Water on the Flowerpot", publication_year: 2001, description: "interesting reflection on issues of the day", price: 12.45},
  {title: "Racing for Daylight", publication_year: 2004, description: "Good work, but needs more development of characters", price: 19.50},
  {title: "Knights of the Dinner Roll", publication_year: 1998, description: "Important new addition to the topic", price: 17.75},
  {title: "Keeping in One Spot", publication_year: 2017, description: "Curious take on modern events", price: 6.65},
  {title: "Cat Cousins", publication_year: 2011, description: "interesting title", price: 12.55},
  {title: "Imagining Some New Stars", publication_year: 2012, description: "interesting reflection on issues of the day", price: 43.25},
  {title: "Purple Liver", publication_year: 2008, description: "interesting title", price: 8.75},
  {title: "Under the Bridge to the Garage", publication_year: 2002, description: "Important new addition to the topic", price: 2.95},
  {title: "Yellow Vines for Blue Flowers", publication_year: 1992, description: "interesting title", price: 14.85},
  {title: "Need to Run Home", publication_year: 2007, description: "interesting reflection on issues of the day", price: 26.75},
  {title: "The Art of Gifting", publication_year: 2006, description: "Would have been nice to learn more about the old woman", price: 8.35},
  {title: "Earthly Desserts", publication_year: 2015, description: "Wonderful reading for a rainy day", price: 19.45},
  {title: "Stay Away from the Heat", publication_year: 2018, description: "Important new addition to the topic", price: 12.00},
  {title: "Pleasures of the Pancake", publication_year: 2015, description: "interesting reflection on issues of the day", price: 7.75},
  {title: "Hello to the Animals", publication_year: 1996, description: "interesting title", price: 15.50},
  {title: "Park Visitors from Mars", publication_year: 1989, description: "Important new addition to the topic", price: 22.00},
  {title: "Resting on the Couch at Noon", publication_year: 2019, description: "Insightful reflection of issues for all of us", price: 16.85},
  {title: "Jealous of the Hat Man", publication_year: 2014, description: "interesting reflection on issues of the day", price: 28.50},
  {title: "Inside the Doorway", publication_year: 2006, description: "Important new addition to the topic", price: 19.95},
  {title: "Fanatical Phantoms", publication_year: 2009, description: "interesting title", price: 23.95}
]

books.each do |book|
  b = Book.new(book)

  # select random author
  author_array = Author.all.map do |author|
    author.id
  end
  random_author = author_array.sample
  a = Author.find(random_author)

  # select random book genre
  book_genre_array = BookGenre.all.map do |book_genre|
    book_genre.id
  end
  random_book_genre = book_genre_array.sample
  g = BookGenre.find(random_book_genre)

  b.author = a
  b.book_genre = g
  b.save
end

shops = [
  {name: "Book Times and Cookies", capacity: 2500, open_date: DateTime.new(2015,5,28), city: "Houston", state: "TX"},
  {name: "Reading Lair", capacity: 1200, open_date: DateTime.new(1997,10,12), city: "Denver", state: "CO"},
  {name: "Story Nook and Coffee", capacity: 3300, open_date: DateTime.new(2010,2,17), city: "Jacksonville", state: "FL"},
  {name: "Information World", capacity: 7500, open_date: DateTime.new(2004,9,10), city: "Boston", state: "MA"},
  {name: "Page Turners", capacity: 2000, open_date: DateTime.new(2013,11,14), city: "Los Angeles", state: "CA"},
  {name: "Bookmarks and Bagels", capacity: 3000, open_date: DateTime.new(1999,12,1), city: "Boise", state: "ID"}
]

shops.each do |shop|
  Shop.create(shop)
end

book_objects = Book.all

book_objects.each do |book|
  shops = Shop.all
  shops_count = shops.size
  number = (1..shops_count).to_a.sample

  while number > 0
    shop_number = (1..shops_count).to_a.sample
    bs = BookShop.new(book: book, shop: shops[shop_number - 1])
    bs.save
    number -= 1
  end
end
