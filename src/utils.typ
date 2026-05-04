// Given an author field, return the array of authors, each being a 'normalized'
// author (see single-author-normalizer below). Useful to 'normalize' the author
// field.
#let author-normalizer(author) = {

  // Given an single author field, return a dictionnary with the name and mail of
  // the author.
  let single-author-normalizer(author) = {
    if type(author) == str {
      (name: author, mail: none)
    } else if type(author) == dictionary {
      if author.at("mail", default: none) == none or author.mail == "" {
        (name: author.name, mail: none)
      } else {
        author
      }
    }
  }

  if type(author) == str or type(author) == dictionary {
    (single-author-normalizer(author),)
  } else if type(author) == array {
    author.map(single-author-normalizer)
  }
}
