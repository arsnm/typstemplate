#import "./utils.typ": author-normalizer

#let report(
  author: ((name: "<author_name>", mail: ""),),
  show-mail: false, // set to true to show the mail of the authors in the header
  _title: "<title>", // the "_" is necessary to avoid overwriting the default
                     // title function
  subtitle: "<subtitle>",
  date: none,
  mcat: "<main_cat>", // main category, e.g. the class, school name, etc.
  scat: "<secondary_cat>", // secondary category, e.g. the subject, course title, etc.
  lang: "en",
  paper: "a4",
  font: "New Computer Modern",
  font-size: 10pt,
  body,
) = {
  let _author = author-normalizer(author)

  set document(
    author: _author.map(a => a.name),
    title: _title,
  )

  set text(
    font: font,
    size: font-size,
    lang: lang,
  )

  set page(
    paper: paper,
    margin: 2cm,
    header: grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),

      stack(
        dir: ttb,
        spacing: 0.3em,
        .._author.map(a => [
          _#{
            if a.mail != none {
              link("mailto:" + a.mail)[
                #{if show-mail [#a.name (#a.mail)] else [#a.name]}
              ]
            } else {
              a.name
            }
          }_
        ])
      ),

      [_#(mcat) - #(scat)_],

      if date != none and date != "" [_#(date)_] else [_#datetime.today().display()_]
    ),
    footer: [
      #h(1fr)
      #context[
        #counter(page).display("1")/#counter(page).final().at(0)
      ]
    ]
  )

  show title: it => {
    set text(size: 1.7em, weight: "bold", hyphenate: false)
    set align(center)
    underline(stroke: red, offset: 3pt)[
      #it
    ]
  }

  show heading: it => {
    let pipes = "|" * it.level
    set text(weight: "semibold")
    block(above: 1.25em, below: 1em)[
      #text(fill: gray)[#pipes]
      #h(0.3em)
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      #it.body
    ]
  }
  set heading(numbering: "1.1.1.")
  set heading(numbering: "I.i.a.")

  title()
  if subtitle != "" {
    align(center)[
      #block(width: 65%)[
        #text(1.5em, weight: "semibold", hyphenate: false)[#subtitle]
      ]
    ]
  }

  v(1em)

  body

}
