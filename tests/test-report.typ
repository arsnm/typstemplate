#import "../src/lib.typ": *

#let author = (
  (name: "Jonh Doe", mail: "john.doe@email.ext"),
  "Jane Doe",
)
#show: report.with(
  author:author,
  show-mail: true,
  mcat: "MAIN_CAT",
  scat: "secondary_cat",
  date: "",
  lang: "fr",
  _title: "Title",
  subtitle: "Template example"
)

Here is an example of how the report template can be used. The point of this
template is to be quite minimalist but still efficient to get a nice looking
document.

= Heading

== Another one

=== It continues...
