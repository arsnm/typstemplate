#let report(
  author: "arsnm",
  title: "Report",
  date: none,
  mcat: "", // main category, e.g. the class, school name, etc.
  scat: "", // secondary category, e.g. the subject, course title, etc.
  lang: "en",
  paper: "a4",
  font: "New Computer Modern",
  font-size: 10pt,
  body,
) = {

  set document(
    author: author,
    title: title,
  )

  set text(
    font: font,
    size: font-size,
  )

  set page(
    paper: paper,
    margin: 2cm,
    header: [
      _#(author)_
      #h(1fr)
      _#(mcat) - #(scat)_
      #h(1fr)
      _{if date != none then date else datetime.today().display("yyyy-MM-dd")}_
    ],

  )


}
