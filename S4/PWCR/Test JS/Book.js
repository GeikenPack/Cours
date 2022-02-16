export class Book {
  constructor(title, author, description, pages, currentPage, read)
  {
    this.title = title
    this.author = author
    this.description = description
    this.pages = pages
    this.currentPage = currentPage
    this.read = read
  }

  readBook(page)
  {
    if (page <= 1 || page >= this.pages)
    {
      return 0
    }
    else
    {
      currentPage = page
      if (page === pages)
      {
        read = true
      }
    }
    return 1
  }
}

export const books = [];
books.push(new Book("livre1", "Pack", "Premier livre", 50, 5, false))
books.push(new Book("livre2", "Pack", "Deuxième livre", 60, 5, false))
books.push(new Book("livre3", "Pack", "Troisième livre", 10, 5, false))

books[0].readBook(10)
books[0].readBook(50)

books[1].readBook(7)
books[1].readBook(60)

books[2].readBook(9)
books[2].readBook(10)
