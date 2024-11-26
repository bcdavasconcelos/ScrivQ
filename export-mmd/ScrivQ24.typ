#import "_extensions/templates/typst/orange/lib.typ": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, update-heading-image

//#set text(font: "Linux Libertine")
//#set text(font: "TeX Gyre Pagella")
//#set text(font: "Lato")
//#show math.equation: set text(font: "Fira Math")
//#show math.equation: set text(font: "Lato Math")
//#show raw: set text(font: "Fira Code")

#show: book.with(
  title: "ScrivQ",
  subtitle: "A Scrivener Template for Quarto Publising",
  date: "Anno scolastico 2024",
  author: "Bernardo C. D. A. Vasconcelos",
  lang: "en",
  copyright: [
    Copyright © 2024 Bernardo César Diniz Athayde Vasconcelos

    POLYTROPIKAL Publishing.

    With thanks to the #link("https://github.com/flavio20002/typst-orange-template", "Typst Orange Template.")

    Licensed under the Apache 2.0 License (the "License").
    You may not use this file except in compliance with the License. You may obtain a copy of
    the License at https://www.apache.org/licenses/LICENSE-2.0. Unless required by
    applicable law or agreed to in writing, software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and limitations under the License.

    _First printing, 2024-11_
    #pagebreak()
  ]
  
)

// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let d = (:)
  let fields = old_block.fields()
  fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.amount
  }
  return block.with(..fields)(new_content)
}

#let unescape-eval(str) = {return eval(str.replace("\\", ""))}

#let empty(v) = {
  if type(v) == "string" {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == "content" {
    if v.at("text", default: none) != none {return empty(v.text)}
    for child in v.at("children", default: ()) {
      if not empty(child) {return false}
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subrefnumbering: "1a",
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => numbering(subrefnumbering, n-super, quartosubfloatcounter.get().first() + 1))
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => {
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          }

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != "string" {return it}
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {return it}
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let old_title = old_title_block.body.body.children.at(2)

  // TODO use custom separator if available
  let new_title = if empty(old_title) {[#kind #it.counter.display()]} else {[#kind #it.counter.display(): #old_title]}

  let new_title_block = block_with_new_content(
    old_title_block, 
    block_with_new_content(
      old_title_block.body, 
      old_title_block.body.body.children.at(0) +
      old_title_block.body.body.children.at(1) +
      new_title))

  block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color, 
        width: 100%, 
        inset: 8pt)[#text(icon_color, weight: 900)[#icon] #title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: white, width: 100%, inset: 8pt, body))
      }
    )
}


#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: "alegreya sans",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "alegreya sans",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

  if cols == 1 {doc} else {columns(cols, doc)}
}

#set table(
  inset: 6pt,
  stroke: none
)


#show heading: it => [#h(2em) #it]


#show: doc => article(
  title: [Hello, ScrivQ],
  authors: (
    ( name: [Bernardo Vasconcelos],
      affiliation: [],
      email: [] ),
    ),
  date: [2024-11-01],
  abstract: [The Abstract],
  abstract-title: "Abstract",
  paper: "a4",
  font: ("Gentium Plus",),
  fontsize: 12pt,
  sectionnumbering: "1.1.a",
  toc_title: [Table of contents],
  toc_depth: 3,
  cols: 1,
  doc,
)
#import "@preview/fontawesome:0.1.0": *
#import "@preview/ctheorems:1.1.0": *
#show: thmrules
#let conjecture = thmbox("conjecture", "Conjecture")
#let corollary = thmbox("corollary", "Corollary")
#let definition = thmbox("definition", "Definition")
#let example = thmbox("example", "Example")
#let exercise = thmbox("exercise", "Exercise")
#let lemma = thmbox("lemma", "Lemma")
#let proposition = thmbox("proposition", "Proposition")
#let theorem = thmbox("theorem", "Theorem")


#pagebreak()
= Instalation
<instalation>
To use ScrivQ24, you need the #link("https://quarto.org/docs")[Quarto] open-source scientific and technical publishing system.

#block[
#callout(
body: 
[
- Visit the #link("https://quarto.org/docs/get-started/")[get started] guide to download.
- Check the #link("https://quarto.org/docs/get-started/hello/vscode.html")[tutorial] to learn how to create, build, and preview documents.
- Install the Quarto extension for #link("https://quarto.org/docs/get-started/#quarto-for-vs-code")[VS Code] and #link("https://quarto.org/docs/get-started/#quarto-for-rstudio")[R Studio];.
- Find out more at #link("https://github.com/mcanouil/awesome-quarto")[Awesome Quarto];, #link("https://github.com/quarto-ext?type=source")[Quarto Extensions];, #link("https://github.com/search?q=topic%3Aquarto&type=repositories")[Quarto on Github];, #link("https://community.rstudio.com/tags/quarto")[RStudio Community];, #link("https://stackoverflow.com/questions/tagged/quarto")[Stack Overflow];, #link("https://twitter.com/quarto_pub")[Twitter];.
- See also the #link("https://pandoc.org/MANUAL.html")[Pandoc User’s Guide];, #link("https://github.com/jgm/pandoc/discussions")[Pandoc-Discuss];, and #link("https://stackoverflow.com/questions/tagged/pandoc")[Pandoc at Stack Overflow];.

]
, 
title: 
[
New to Quarto?
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
#block[
#callout(
body: 
[
- On macOS#footnote[If you’re on a Mac, install Homebrew by pasting the following on the Terminal: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.];, use #link("https://brew.sh")[Homebrew] to `brew install quarto && brew install chromium`.
- On Windows, use #link("https://chocolatey.org/")[Chocolatey] to `choco install quarto`.

After that, install TinyTex with `quarto install tool tinytex`.

]
, 
title: 
[
Quickstart
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
#block[
#callout(
body: 
[
Run a `quarto check` on your installation.

Some Python and R computations will require additional packages (cf. @wrn-r-packages<cite_1>).

]
, 
title: 
[
Installation issues
]
, 
background_color: 
rgb("#f7dddc")
, 
icon_color: 
rgb("#CC1914")
, 
icon: 
fa-exclamation()
)
]
#figure([
#block[
#callout(
body: 
[
To run R computations, install #link("https://www.r-project.org")[R];, #link("https://posit.co/download/rstudio-desktop/")[R Studio];, and (#emph[at least];) the following packages:

#figure([
#set align(left)
```
py_install(packages = "matplotlib")
install.packages("reticulate")
install.packages("markdown")
install.packages("tidyverse")
install.packages("kableExtra")
install.packages("downlit")
install.packages("xml2")
```

], caption: figure.caption(
position: top, 
[
Additional R packages.
]), 
kind: "quarto-float-lst", 
supplement: "Listing", 
)
<lst-r-packages>


]
, 
title: 
[Dependencies for computations]
, 
background_color: 
rgb("#fcefdc")
, 
icon_color: 
rgb("#EB9113")
, 
icon: 
fa-exclamation-triangle()
)
]
], caption: figure.caption(
position: top, 
[
]), 
kind: "quarto-callout-Warning", 
supplement: "Warning", 
numbering: "1", 
)
<wrn-r-packages>


#pagebreak()
= ScrivQ
<scrivq>
The ScrivQ template is designed to compile #link("https://quarto.org/docs/books/")[Quarto Books] (PDF#footnote[Please note that #link("https://quarto.org/docs/output-formats/pdf-engine.html#installing-tex")[tinytex] is also required for LaTeX to PDF output.];, DOCX, and HTML) with zero configuration and no dependencies on external files. The bibliography, the template files, extensions, and filters are all included in the project and will be created by the compiler script.

#block[
#callout(
body: 
[
Hit `Cmd + Opt + E` to publish your Quarto Book right away.

]
, 
title: 
[
When Quarto is installed…
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
#block[
#callout(
body: 
[
- #strong[Download] the #link("https://github.com/bcdavasconcelos/ScrivQ/releases")[latest release];.
- #strong[Sponsor] #link("https://github.com/sponsors/bcdavasconcelos")[this project];.
- #strong[Take part] in the discussion at the #link("https://forum.literatureandlatte.com/t/scrivq-a-template-to-control-quarto-export-multiple-files-manage-bibliography-and-easily-create-cross-references/134755")[Scrivener forum];.

]
, 
title: 
[
ScrivQ
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
#block[
#callout(
body: 
[
#link("https://github.com/iandol")[\@iandol] for the exceptional #link("https://github.com/iandol/scrivomatic")[Scrivomatic] from which ScrivQ descended.

Check his #link("https://github.com/iandol/scrivomatic#writing-in-scrivener")[writing in Scrivener tutorial];, if you haven’t done so yet.

]
, 
title: 
[
Thank you
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
#pagebreak()
= Compiler Script
<compiler-script>
#figure([
#box(image("screencap.png", width: auto))
], caption: figure.caption(
position: bottom, 
[
There is a ruby script to reformat the text and create the dependencies. It allows you to pass a file name and a format, so you can edit the post-processing panel to change the output format (#emph[e.g.] change `html` to `pdf` / `docx` / `epub` etc.). It is embedded in this project’s Compiler format.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-scriv-compile>


The script’s output is redirected `&>` to a `Quarto.log` file that will be automatically opened when an error happens and no output is produced. If everything runs smoothly, however, you should see only the output file open.

This compiler script descends from #link("https://github.com/iandol/scrivomatic")[#strong[Scrivomatic];];, but with several changes to allow splitting the final document into sub-files. This task entails some challenges as footnotes and image references must be moved around before the file is split. Check the compiler script to see how this got solved and please report any errors.

#block[
#callout(
body: 
[
#link("https://www.ruby-lang.org/en/downloads")[Ruby] must be installed on Windows machines.

]
, 
title: 
[
Warning
]
, 
background_color: 
rgb("#fcefdc")
, 
icon_color: 
rgb("#EB9113")
, 
icon: 
fa-exclamation-triangle()
)
]
#pagebreak()
= Citations
<citations>
#block[
Μῆνιν ἄειδε, θεά, Πηληιάδεω Ἀχιλῆος (#link(<ref-HomIl>)[#emph[Hom Il];];, I 1<cite_2>) The wrath sing, goddess, of Peleus’ son Achilles.

]
In ScrivQ, we use #link("https://en.wikipedia.org/wiki/CiteProc")[Citeproc] to handle the bibliography and provide consistent output across different formats. Given Citeproc’s lack of features beloved by #strong[BibTeX] users, we included #link("https://bcdavasconcelos.github.io/citetools")[Cite Tools] to enable multipart bibliographies, provide backlinks (see `backref` from #link("www.ctan.org/pkg/hyperref")[HyperRef];), and access bibliographic data from sources (#emph[author];, #emph[editor];, #emph[translator];, #emph[date];, #emph[edition];, #emph[number];, and so on).

#block[
#callout(
body: 
[
The official documentation on citations can be found at #link("pandoc.org/MANUAL.html#citations")[Pandoc] and #link("quarto.org/docs/authoring/footnotes-and-citations.html#sec-citations")[Quarto];.

]
, 
title: 
[
Official documentation
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
#block[
#callout(
body: 
[
Deleting #link("https://bcdavasconcelos.github.io/citetools")[Cite Tools] might cause the compilation to #underline[fail];.

]
, 
title: 
[
Cite Tools and ScrivQ
]
, 
background_color: 
rgb("#fcefdc")
, 
icon_color: 
rgb("#EB9113")
, 
icon: 
fa-exclamation-triangle()
)
]
#block[
#callout(
body: 
[
`quarto install extension bcdavasconcelos/citetools`.

]
, 
title: 
[
Using #strong[Cite Tools ];in other projects
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
== Basic citations
<basic-citations>
+ The citation syntax is straightforward: `@Citekey` for #strong[Author (Date)] (an #emph[in-text] citation); `[@Citekey]` for #strong[Author, Date];; and `[-@Citekey]` for #strong[Date];.

+ The citation key is optionally followed by a locator, which can be a page number, a line number, a chapter number, or a section number, preceded by a comma, #emph[e.g.] `[@Citekey, p.10]`.

+ Multiple citations can be grouped in brackets separated by semicolons `[@CitekeyA; @CitekeyB]`. The CSL style used by Citeproc will determine the presence (or absence) of parenthesis around the rendered citation. (We favor a style that doesn’t use parenthesis, but that is up to you.)

#figure([
#table(
  columns: (33.33%, 33.33%, 33.33%),
  align: (center,center,center,),
  table.header([#strong[Character Style];], [#strong[Markdown Source];], [#strong[Rendered output];#footnote[The rendered citation will appear only in the output document; but not in the Scrivener project.];],),
  table.hline(),
  [#strong[Cite];\*], [`[-@Long2004]`], [#link(<ref-Long2004>)[2004];<cite_3>],
  [#strong[Cite];\*], [`[-@Long2004, p.15]`], [#link(<ref-Long2004>)[2004, p. 15];<cite_4>],
  [#strong[Cite];], [`[@Long2004]`], [#link(<ref-Long2004>)[LONG, 2004];<cite_5>],
  [#strong[Cite];], [`[@Long2004, p.15]`], [#link(<ref-Long2004>)[LONG, 2004, p. 15];<cite_6>],
)
], caption: figure.caption(
position: bottom, 
[
Citation syntax in Quarto and Pandoc.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-citations>


Here is a short demonstration of the basic citation feature. We suggest grouping the citations using parenthesis and using character styles to apply the correct markup. If you were using other CSL styles, then you could drop the parenthesis.

#block[
#callout(
body: 
[
`Long thinks [...] on the deliberations of the prudent person ([-@Long2004, p.17]).`

Long thinks \[…\] on the deliberations of the prudent person (#link(<ref-Long2004>)[2004, p. 17];<cite_7>).

]
, 
title: 
[
(Date, locator)
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
#block[
#callout(
body: 
[
`...on the deliberations of the prudent person ([@Long2004, p.17]).`

…on the deliberations of the prudent person (#link(<ref-Long2004>)[LONG, 2004, p. 17];<cite_8>).

]
, 
title: 
[
(Author, Date, locator)
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
#block[
#callout(
body: 
[
`...on the deliberations of the prudent person ([@Long2004, p.17]; [@hoffman2014, p.15]).`

…on the deliberations of the prudent person (#link(<ref-Long2004>)[LONG, 2004, p. 17];<cite_9>; #link(<ref-hoffman2014>)[HOFFMAN & PRAKASH, 2014, p. 15];<cite_10>).

]
, 
title: 
[
(Author, Date, locator; Author, Date, locator)
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
== Citation of specific fields
<citation-of-specific-fields>
To inject the correct markup – `[@Citekey]{.csl_field}` – and allow us to cite different fields from our bibliographic entry, we rely on #strong[Character Styles] (#emph[e.g.] #emph[Cite Author];, #emph[Cite Editor];, #emph[Cite Issued];, and so on). Officially, #link("https://docs.citationstyles.org/en/stable/specification.html#appendix-iv-variables")[CSL has Variables];, #link("https://en.wikipedia.org/wiki/BibTeX#Field_types")[BibTeX has Fields];, and #link("https://en.wikipedia.org/wiki/RIS_(file_format)#Tags")[RIS has Tags];, but we stuck to the term fields to describe all of them.

#figure([
#table(
  columns: (33.33%, 33.33%, 33.33%),
  align: (center,center,center,),
  table.header([Character Style], [Markdown Source], [Rendered Output],),
  table.hline(),
  [Cite Author], [`[@DA]{.author}`], [Aristotelis],
  [Cite Editor], [`[@DA]{.editor}`], [Bekker],
  [Cite Translator], [`[@DA]{.translator}`], [Τατάκης],
  [Cite Issued], [`[@DA]{.issued}`], [1834],
  [Cite Title], [`[@DA]{.title}`], [#emph[De Anima];],
  [Cite Title-short], [`[@DA]{.title-short}`], [#emph[De An.];],
  [Cite Original-title], [`[@DA]{.original-title}`], [περὶ ψυχῆς],
  [Cite Publisher], [`[@DA]{.publisher}`], [Reimer],
  [Cite Publisher-Place], [`[@DA]{.publisher-place}`], [Berlin],
)
], caption: figure.caption(
position: bottom, 
[
All ready-made #strong[Character Styles] for the Cite Field lua filter.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-cite-field>


#block[
#callout(
body: 
[
`[@DA]{.editor} published the first modern edition of Aristotle's [@DA]{.title} ([@DA]{.original-title}) in [@DA]{.issued}. A new edition by [@DABiehl]{.editor} appeared in [@DABiehl]{.issued} (later reprinted in [@DATheiler]{.translator}'s [@DATheiler]{.issued} translation).`

Bekker published the first modern edition of Aristotle’s #emph[De Anima] (περὶ ψυχῆς) in 1834. A new edition by Biehl appeared in 1896 (later reprinted in Theiler’s 1995 translation).

]
, 
title: 
[
An example with field citation
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
== Multipart Bibliography
<multipart-bibliography>
#block[
#callout(
body: 
[
There is no need to keep #strong[separate bibliography files] in the system. Simply #strong[copy and paste the references directly to Scrivener] following the instructions below.

]
, 
title: 
[
Where do I plug my bibliography?
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
#block[
#callout(
body: 
[
#strong[Pandoc] and #strong[Quarto] use a #link("https://docs.citationstyles.org/en/stable/specification.html")[CSL] (#emph[Citation Style Language];) engine and prefer #link("https://docs.citationstyles.org/en/stable/specification.html")[CSL-YAML and CSL-JSON] (performing up to 10x faster) over #link("https://en.wikipedia.org/wiki/BibTeX#Entry_types")[BibTeX] and #link("https://en.wikipedia.org/wiki/RIS_(file_format)#Type_of_reference")[RIS];, which need to be converted before they can be understood.

]
, 
title: 
[
References format
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
#block[
#callout(
body: 
[
- Check #link("www.zotero.org")[Zotero];#footnote[Zotero even offers an API to download shared libraries by merely accessing a link, such as `https://api.zotero.org/groups/`LibraryID`/items?format=bibtex&limit=999` where `LibraryID` corresponds to the library’s 7-digit code (visible in the middle of the library URL).] and #link("www.jabref.org")[JabRef] on all platforms.
- On macOS, check #link("www.sonnysoftware.com/")[Bookends] and #link("bibdesk.sourceforge.io")[Bibdesk];;
- See also #link("en.wikipedia.org/wiki/Comparison_of_reference_management_software")[this comparison];.

]
, 
title: 
[
What if I don’t have a bibliography ready?
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
=== How to manually create a multipart bibliography
<nte-multibib1>
+ Using the #strong[Section Type] `File`, we create a representation of our bibliography file to add the data (#emph[e.g.] #link("refs/primary-sources.yml")[Primary Sources] and #link("refs/secondary-sources.yml")[Secondary Sources];).
+ On the Metadata panel we set the relative path (`ID-Prefix` + `ID`) and the extension (`Extension`) of the actual bibliography file that will be created upon #strong[Compile];.

#figure([
#box(image("BibliographyFile.png", width: auto))
], caption: figure.caption(
position: bottom, 
[
The Metadata panel
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-bibliography>


#block[
#set enum(numbering: "1.", start: 3)
+ We need to tell Quarto about the bibliography file by adding it to the #link("_quarto.yml")[\_quarto] configuration file (there is a bibliography section), then we can print the formatted bibliography using the ID (#emph[e.g.] "primary-sources") with the #strong[Paragraph Style] #emph[Div Bibliography];.
]

=== How to automatically create a multipart bibliography
<nte-multibib2>
We can use the #strong[Section Type] Bibliography to automate steps 3 and 4. This is very convenient for books that need the bibliography to print only once at the very end.

+ Using the #strong[Section Type] `File`, we create a representation of our bibliography file to add the data (#emph[e.g.] #link("refs/primary-sources.yml")[Primary Sources] and #link("refs/secondary-sources.yml")[Secondary Sources];).
+ On the Metadata panel we set the relative path (`ID-Prefix` + `ID`) and the extension (`Extension`) of the actual bibliography file that will be created upon #strong[Compile];.
+ The metadata with the file path will be automatically added and the formatted bibliography will be printed in the same section as the data, with the same section title.

== Backlinks
<backlinks>
In Citeproc, `link-citations` control whether citations in the body of the text should be clickable links to the reference in the bibliography. #strong[Cite Tools] takes it further and adds a backlink to each citation an entry has received in the document in a crescent ordinal fashion#footnote[The reader will see the page number instead of a crescent ordinal number in some output formats, such as PDF.];. This allows the reader to easily arrive at sections of the text where the same reference was discussed and quickly see how many times each reference was used with the array of backlinks.

#block[
#callout(
body: 
[
Turn `link-fields` into false to avoid undesired linking

]
, 
title: 
[
Citing specific fields
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
#block[
#callout(
body: 
[
- #underline[link-citations];: Hyperlink citations to the corresponding bibliography entries. Defaults to true.
- #underline[link-fields];: Hyperlink citations targeting specific CSL fields to the corresponding entries in the bibliography. Defaults to true.
- #underline[link-bibliography];: Hyperlink DOIs, PMCIDs, PMID, and URLs in bibliographies. Defaults to true.
- #underline[lang];: Affects the bibliography tags. Defaults to `en-US`.

]
, 
title: 
[
Bibliography links
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
#pagebreak()
= Quarto
<quarto>
#block[
"I propose a toast, to my self-control. You see it helpless, crawling on the floor." Morphine, #emph[Cure For Pain] (#link(<ref-MorphineCFP>)[1993];<cite_11>)

]
== Scrivener Project Templates
<scrivener-project-templates>
All sorts of internal #strong[Scrivener Templates] have been included for convenience. They serve as starting points to create new sections. Click #strong[Project \> New From Template] and select the desired #strong[Section Types] from the list, which includes `Bibliography`, `Code`, `Computation`, `Diagram Dot`, `Diagram Mermaid`, `Div`, `Equation`, `File`, `Metadata`, `Section`, `Text`, `Text (Anchored)`#footnote[Text section with ID for cross-referencing.];.

This provides a huge number of options as the metadata can be edited to allow the creation of different #strong[Quarto] elements and their customization (#emph[e.g.] using classes and attributes). Using the #strong[Section Type] `Div`, for example, one could create 8 different #strong[Amsthm] elements, 5 different #strong[Callouts];, and several #strong[Column] environments. Using the `Computation`, one can create executable code blocks with R, Python, and Ruby. The #strong[Section Type] `Section` can be numbered, unnumbered, or part of the appendix (with the use of classes).

Look at the ready-made examples to see what else is possible.

== Cross-referencing
<cross-referencing>
When creating a #strong[Section];, select the correct `ID-Prefix` (#emph[e.g.] `sec-`) and fill the `ID` metadata field with a value (#emph[e.g.] `xref`). Then, #strong[use Scrivener placeholders] ( `<\$Custom:ID-Prefix><\$Custom:ID>`) with a link to the cited element, so that this gets replaced with `sec-xref`. This works regardless of the element being cross-referenced (#emph[e.g.] #emph[section];, #emph[table];, #emph[figure];, #emph[listing];) because this strategy ensures the citation will use the `<\$Custom:ID-Prefix>` pulled from the targeted element (#emph[e.g.] `sec-`, `tbl-`, `fig-`, `lst-`), making it compatible with all element types.

#block[
#callout(
body: 
[
A less verbose option uses a replacement rule:

- `s\crivlink` is replaced with `<\$Custom:ID-Prefix><\$Custom:ID>`.
- `s\crivpath` and `$\!` are replaced with `<\$Custom:ID-Prefix><\$Custom:ID><\$Custom:Extension>`.

]
, 
title: 
[
Alternative to placeholders
]
, 
background_color: 
rgb("#fcefdc")
, 
icon_color: 
rgb("#EB9113")
, 
icon: 
fa-exclamation-triangle()
)
]
#block[
#callout(
body: 
[
+ Type #underline[your-keyword-of-choice] or `s\crivlink`;
+ Apply the #strong[Character Style] #emph[Cite] (#strong[hit] `Shift + Command + Y`)
+ Link to the document that contains the element (#strong[hit] #underline[Command + L];).

]
, 
title: 
[
How to cross-reference an element
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
#block[
#callout(
body: 
[
Understand that #strong[Scrivener Placeholders] can only pull information from the section properties, so the generic link label (#emph[e.g.] `s\crivlink`) will work to reference elements created from #strong[Section Types];.

To reference elements created from #strong[Raw Markup] or #strong[Character Style];, use the actual `ID` given (#emph[e.g.] `fig-ulysses`).

]
, 
title: 
[
Known limitation
]
, 
background_color: 
rgb("#ffe5d0")
, 
icon_color: 
rgb("#FC5300")
, 
icon: 
fa-fire()
)
]
== Amsthm
<amsthm>
#figure([
#table(
  columns: 3,
  align: (center,center,center,),
  table.header([#strong[Species];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [Conjecture], [`[@cnj-demo]`], [@cnj-demo<cite_12>],
  [Corollary], [`[@cor-demo]`], [@cor-demo<cite_13>],
  [Definition], [`[@def-demo]`], [@def-demo<cite_14>],
  [Example], [`[@exm-demo]`], [@exm-demo<cite_15>],
  [Exercise], [`[@exr-demo]`], [@exr-demo<cite_16>],
  [Lemma], [`[@lem-demo]`], [@lem-demo<cite_17>],
  [Proposition], [`[@prp-demo]`], [@prp-demo<cite_18>],
  [Theorem], [`[@thm-demo]`], [@thm-demo<cite_19>],
)
], caption: figure.caption(
position: bottom, 
[
Cross-referencing #strong[Amsthm] elements in ScrivQ.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-amsthm>


#conjecture()[
Demonstration of the #strong[Conjecture] theorem environment using the #strong[Section Type] `Div` with #strong[ID] `#cnj-demo`.

] <cnj-demo>
#corollary()[
Demonstration of the #strong[Corollary] theorem environment using the #strong[Section Type] `Div` with #strong[ID] `#cor-demo`.

] <cor-demo>
#definition()[
Demonstration of the #strong[Definition] theorem environment using the #strong[Section Type] `Div` with #strong[ID] `#def-demo`.

] <def-demo>
#example()[
Demonstration of the #strong[Example] theorem environment using the #strong[Section Type] `Div` with #strong[ID] `#exm-demo`.

] <exm-demo>
#exercise()[
Demonstration of the #strong[Exercise] theorem environment using the #strong[Section Type] `Div` with #strong[ID] `#exr-demo`.

] <exr-demo>
#lemma()[
Demonstration of the #strong[Lemma] theorem environment using the #strong[Section Type] `Div` with #strong[ID] `#lem-demo`.

] <lem-demo>
#proposition()[
Demonstration of the #strong[Proposition] theorem environment using the #strong[Section Type] `Div` with #strong[ID] `#prp-demo`.

] <prp-demo>
#theorem()[
Demonstration of the #strong[Theorem] theorem environment using the #strong[Section Type] `Div` with #strong[ID] `#thm-demo`.

$ [x^2 + y^2 = z^2] $

] <thm-demo>
== Callouts
<callouts>
#figure([
#table(
  columns: 3,
  align: (center,center,center,),
  table.header([#strong[Species];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [Caution], [`[@cau-caution]`], [@cau-caution<cite_20>],
  [Important], [`[@imp-important]`], [@imp-important<cite_21>],
  [Note], [`[@nte-note]`], [@nte-note<cite_22>],
  [Tip], [`[@tip-tip]`], [@tip-tip<cite_23>],
  [Warning], [`[@wrn-warning]`], [@wrn-warning<cite_24>],
)
], caption: figure.caption(
position: bottom, 
[
Cross-referencing callouts.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-callouts>


Using styles, you can create normal or collapsed callouts.

#block[
#callout(
body: 
[
This is a Callout Caution using a #strong[Paragraph Style];.

]
, 
title: 
[
Caution (collapsed)
]
, 
background_color: 
rgb("#ffe5d0")
, 
icon_color: 
rgb("#FC5300")
, 
icon: 
fa-fire()
)
]
#block[
#callout(
body: 
[
This is a Callout Caution using a #strong[Paragraph Style];.

]
, 
title: 
[
Caution
]
, 
background_color: 
rgb("#ffe5d0")
, 
icon_color: 
rgb("#FC5300")
, 
icon: 
fa-fire()
)
]
#figure([
#block[
#callout(
body: 
[
Demonstration of a #strong[Callout Caution] using the #strong[Section Type] `Div` with class `.callout-caution` and with #strong[ID] `#cau-caution`.

]
, 
title: 
[]
, 
background_color: 
rgb("#ffe5d0")
, 
icon_color: 
rgb("#FC5300")
, 
icon: 
fa-fire()
)
]
], caption: figure.caption(
position: top, 
[
]), 
kind: "quarto-callout-Caution", 
supplement: "Caution", 
numbering: "1", 
)
<cau-caution>


#figure([
#block[
#callout(
body: 
[
Demonstration of a #strong[Callout Important] using the #strong[Section Type] `Div` with class `.callout-important` and with #strong[ID] `#imp-important`.

]
, 
title: 
[]
, 
background_color: 
rgb("#f7dddc")
, 
icon_color: 
rgb("#CC1914")
, 
icon: 
fa-exclamation()
)
]
], caption: figure.caption(
position: top, 
[
]), 
kind: "quarto-callout-Important", 
supplement: "Important", 
numbering: "1", 
)
<imp-important>


#figure([
#block[
#callout(
body: 
[
Demonstration of a #strong[Callout Note] using the #strong[Section Type] `Div` with class `.callout-note` and with #strong[ID] `#nte-note`.

]
, 
title: 
[]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
], caption: figure.caption(
position: top, 
[
]), 
kind: "quarto-callout-Note", 
supplement: "Note", 
numbering: "1", 
)
<nte-note>


#figure([
#block[
#callout(
body: 
[
Demonstration of a #strong[Callout Tip] using the #strong[Section Type] `Div` with class `.callout-tip` and with #strong[ID] `#tip-tip`.

]
, 
title: 
[]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
)
]
], caption: figure.caption(
position: top, 
[
]), 
kind: "quarto-callout-Tip", 
supplement: "Tip", 
numbering: "1", 
)
<tip-tip>


#figure([
#block[
#callout(
body: 
[
Demonstration of a #strong[Callout Warning] using the #strong[Section Type] `Div` with class `.callout-warning` and with #strong[ID] `#wrn-warning`.

]
, 
title: 
[]
, 
background_color: 
rgb("#fcefdc")
, 
icon_color: 
rgb("#EB9113")
, 
icon: 
fa-exclamation-triangle()
)
]
], caption: figure.caption(
position: top, 
[
]), 
kind: "quarto-callout-Warning", 
supplement: "Warning", 
numbering: "1", 
)
<wrn-warning>


== Diagrams
<diagrams>
Similarly, we can create #strong[Dot] and #strong[Mermaid] diagrams using #strong[Section Types] (#emph[Diagram Dot];, #emph[Diagram Mermaid];), #strong[Paragraph Styles] (#emph[Diagram Dot];, #emph[Diagram Mermaid];), and #strong[Raw Mardown];.

#figure([
#table(
  columns: 3,
  align: (center,center,center,),
  table.header([#strong[Species];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [Dot], [`[@fig-dot-a]`], [@fig-dot-a<cite_25>],
  [Dot], [`[@fig-dot-b]`], [@fig-dot-b<cite_26>],
  [Dot], [`[@fig-dot-c]`], [@fig-dot-c<cite_27>],
  [Mermaid], [`[@fig-mermaid-a]`], [@fig-mermaid-a<cite_28>],
  [Mermaid], [`[@fig-mermaid-b]`], [@fig-mermaid-b<cite_29>],
  [Mermaid], [`[@fig-mermaid-c]`], [@fig-mermaid-c<cite_30>],
)
], caption: figure.caption(
position: bottom, 
[
Cross-referencing #strong[Dot] and #strong[Mermaid] diagrams.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-diagrams>


#figure([
#block[
#box(image("ScrivQ24_files/figure-typst/dot-figure-1.png", height: 3.5in, width: 5.5in))

]
], caption: figure.caption(
position: bottom, 
[
Figure caption
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-dot-a>


#figure([
#block[
#box(image("ScrivQ24_files/figure-typst/dot-figure-3.png", height: 3.5in, width: 5.5in))

]
], caption: figure.caption(
position: bottom, 
[
A graphviz graph with figure reference and caption, using raw markup. See https:\/\/quarto.org/docs/authoring/diagrams.html\#sizing for more details…
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-dot-b>


#figure([
#block[
#box(image("ScrivQ24_files/figure-typst/dot-figure-2.png", height: 3.5in, width: 5.5in))

]
], caption: figure.caption(
position: bottom, 
[
Color wheel diagram
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-dot-c>


#figure([
#block[
#box(image("ScrivQ24_files/figure-typst/mermaid-figure-1.png", height: 3.98in, width: 3.38in))

]
], caption: figure.caption(
position: bottom, 
[
Figure caption
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-mermaid-a>


#figure([
#block[
#box(image("ScrivQ24_files/figure-typst/mermaid-figure-3.png", height: 2.9in, width: 3.65in))

]
], caption: figure.caption(
position: bottom, 
[
Figure caption
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-mermaid-b>


#figure([
#block[
#box(image("ScrivQ24_files/figure-typst/mermaid-figure-2.png", height: 4.69in, width: 6.82in))

]
], caption: figure.caption(
position: bottom, 
[
A Mermaid figure using a Scrivener Section Type \[Computation\] with class \[mermaid\], see https:\/\/quarto.org/docs/authoring/diagrams.html for more details
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-mermaid-c>


== Equations
<equations>
#figure([
#table(
  columns: 3,
  align: (center,center,center,),
  table.header([#strong[Species];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [Equation], [`[@eq-demo-a]`], [@eq-demo-a<cite_31>],
  [Equation], [`[@eq-demo-b]`], [@eq-demo-b<cite_32>],
)
], caption: figure.caption(
position: bottom, 
[
Cross-referencing #strong[equations];.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-equations>


#math.equation(block: true, numbering: "(1)", [ $ t' = frac(t - v / c^2 x, sqrt(1 - v^2 / c^2)) $ ])<eq-demo-a>

#math.equation(block: true, numbering: "(1)", [ $ t' = frac(t - v / c^2 x, sqrt(1 - v^2 / c^2)) $ ])<eq-demo-b>

== Figures
<figures>
#figure([
#table(
  columns: 3,
  align: (center,center,center,),
  table.header([#strong[Species];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [], [`[@fig-ulysses]`], [@fig-ulysses<cite_33>],
  [Multipart Figure], [`[@fig-panel-a]`], [@fig-panel-a<cite_34>],
  [Multipart Figure], [`[@fig-panel-a-item-a]`], [@fig-panel-a-item-a<cite_35>],
  [Multipart Figure], [`[@fig-panel-a-item-b]`], [@fig-panel-a-item-b<cite_36>],
)
], caption: figure.caption(
position: bottom, 
[
Cross-referencing figures.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-figures>


#figure([
#box(image("Ulysses-sirens.jpg", width: auto))
], caption: figure.caption(
position: bottom, 
[
Ulysses and the Sirens.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-ulysses>


Painting by #link(<ref-Draper1909>)[DRAPER, 1909];<cite_37>.

#quarto_super(
kind: 
"quarto-float-fig"
, 
caption: 
[
This multi-figure panel uses the #strong[Section Type] `Div` instead of raw markdown as shown here. `ID`, `Class`, and `Attributes` specific to the block are saved to `Custom Metadata → ID, Class & Attributes`, and then inserted into the markup for this chunk by the Section Layout at compile time.
]
, 
label: 
<fig-panel-a>
, 
position: 
bottom
, 
supplement: 
"Figure"
, 
subrefnumbering: 
"1a"
, 
subcapnumbering: 
"(a)"
, 
[
#grid(columns: 2, gutter: 2em,
  [
#block[
#figure([
#box(image("Elephant2.jpg", width: auto))
], caption: figure.caption(
position: bottom, 
[
Place the label first in the caption, and use the `Caption` style.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-panel-a-item-a>


]
],
  [
#block[
#figure([
#box(image("Elephant3.jpg", width: auto))
], caption: figure.caption(
position: bottom, 
[
Angry elephant with a big trunk.
]), 
kind: "quarto-float-fig", 
supplement: "Figure", 
)
<fig-panel-a-item-b>


]
],
)
]
)
== Listings
<listings>
#figure([
#table(
  columns: 3,
  align: (center,center,center,),
  table.header([#strong[Species];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [Listing], [`[@lst-demo-a]`], [@lst-demo-a<cite_38>],
  [Listing], [`[@lst-demo-b]`], [@lst-demo-b<cite_39>],
)
], caption: figure.caption(
position: bottom, 
[
Cross-referencing listings.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-listings>


#figure([
#set align(left)
```
require "unicode/name"

characters = %w(α β ἇ ᾇ ᾁ)

# characters = 'ἄ'
characters.each do |character|
  puts character.unpack('U*').map { |i| 
  "U+#{i.to_s(16).rjust(4, '0').upcase}"
  }.join
  puts Unicode::Name.of character
end
```

], caption: figure.caption(
position: top, 
[
Decomposition of Unicode characters.
]), 
kind: "quarto-float-lst", 
supplement: "Listing", 
)
<lst-demo-a>


#figure([
#set align(left)
```
#!/usr/bin/env ruby
# frozen_string_literal: false

Encoding.default_external = Encoding::UTF_8

Dir["#{__dir__}/Ruby/**/*.rb"].each do |file|
  require_relative file
end
```

], caption: figure.caption(
position: top, 
[
The caption
]), 
kind: "quarto-float-lst", 
supplement: "Listing", 
)
<lst-demo-b>


== Tables
<tables>
#figure([
#table(
  columns: 3,
  align: (center,center,center,),
  table.header([#strong[Species];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [], [`[@tbl-demo-a]`], [@tbl-demo-a<cite_40>],
  [], [`[@tbl-demo-b]`], [@tbl-demo-b<cite_41>],
  [Multipart Table], [`[@tbl-panel-a]`], [@tbl-panel-a<cite_42>],
  [Multipart Table], [`[@tbl-panel-a-item-a]`], [@tbl-panel-a-item-a<cite_43>],
  [Multipart Table], [`[@tbl-panel-a-item-b]`], [@tbl-panel-a-item-b<cite_44>],
)
], caption: figure.caption(
position: bottom, 
[
Cross-referencing tables.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-tables>


#figure([
#table(
  columns: 2,
  align: (center,center,),
  table.header([#strong[GRC];], [#strong[SKT];],),
  table.hline(),
  [ἐν ἀρχὴ ἦν ὁ~λόγος], [आदौ वाद आसीत्],
)
], caption: figure.caption(
position: bottom, 
[
This table with a passage from John 1.1 uses the #strong[Section Type] #underline[Text] and #strong[Paragraph Style] #underline[Table Caption];.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-demo-a>


#figure([
#table(
  columns: 2,
  align: (center,center,),
  table.header([#strong[GRC];], [#strong[SKT];],),
  table.hline(),
  [ἐν ἀρχὴ ἦν ὁ~λόγος], [आदौ वाद आसीत्],
)
], caption: figure.caption(
position: bottom, 
[
"This is an example of #strong[Section Type] `Table`. The caption and the remaining attributes are added as part of the Section Type markup."
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-demo-b>


#quarto_super(
kind: 
"quarto-float-tbl"
, 
caption: 
[
This is a markdown multi-table panel with two sub-tables generated using a #strong[Section Type] `Div`. The #strong[Custom Metadata] holds the cross-referencing label, classes, and other attributes.
]
, 
label: 
<tbl-panel-a>
, 
position: 
bottom
, 
supplement: 
"Table"
, 
subrefnumbering: 
"1a"
, 
subcapnumbering: 
"(a)"
, 
[
#grid(columns: 1, gutter: 2em,
  [
#block[
#figure([
#table(
  columns: 4,
  align: (center,center,center,center,),
  table.header([#strong[Element];], [#strong[Prefix];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [Equation A], [eq], [A], [B],
  [Equation A], [eq], [C], [D],
  [Listing A], [lst], [E], [F],
)
], caption: figure.caption(
position: bottom, 
[
The first table of the multipart table panel.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-panel-a-item-a>


]
],
  [
#block[
#figure([
#table(
  columns: 4,
  align: (center,center,center,center,),
  table.header([#strong[Element];], [#strong[Prefix];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [Equation B], [eq], [A], [B],
  [Equation B], [eq], [C], [D],
  [Listing B], [lst], [E], [F],
)
], caption: figure.caption(
position: bottom, 
[
The second table of the multipart table panel.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-panel-a-item-b>


]
],
)
]
)
== Sections
<sec-dem>
#figure([
#table(
  columns: 3,
  align: (center,center,center,),
  table.header([#strong[Genus];], [#strong[Markdown Source];], [#strong[Rendered Output];],),
  table.hline(),
  [Section], [`[@sec-demo-a]`], [@sec-demo-a<cite_45>],
  [Break + Section], [`[@sec-demo-e]`], [@sec-demo-e<cite_46>],
  [Heading], [`[@sec-demo-c]`], [@sec-demo-c<cite_47>],
  [Break + Heading], [`[@sec-demo-d]`], [@sec-demo-d<cite_48>],
)
], caption: figure.caption(
position: bottom, 
[
Note that the unnumbered section cannot be referenced.
]), 
kind: "quarto-float-tbl", 
supplement: "Table", 
)
<tbl-sections>


#block[
#heading(
level: 
3
, 
numbering: 
none
, 
[
Section (Unnumbered)
]
)
]
Demonstration of the #strong[Section Type] #emph[Section] using #strong[Class] `.unnumbered`.

=== Section
<sec-demo-a>
Demonstration of the #strong[Section Type] #emph[Section] with #strong[ID] `#sec-demo-a`.

=== Break + Section
<sec-demo-e>
Demonstration of the #strong[Section Type] #emph[Break + Section] with #strong[ID] `#sec-demo-e`.

=== Heading
<sec-demo-c>

#horizontalrule

=== Break + Heading
<sec-demo-d>
#pagebreak()
= Templates and partials
<templates-and-partials>
#block[
#callout(
body: 
[
Users needing control over the parameters in the native #strong[Quarto] templates shouldn’t have to deal with external files. We imported all the templates and partials for the main file types (TeX, HTML, Typst) so they can be edited directly in Scrivener.

]
, 
title: 
[
#strong[Quarto] Templates optionally edited in #strong[Scrivener]
]
, 
background_color: 
rgb("#ffe5d0")
, 
icon_color: 
rgb("#FC5300")
, 
icon: 
fa-fire()
)
]
#block[
#callout(
body: 
[
- #link("_extensions/templates/tex/doc-class.tex")[doc-class]
- #link("_extensions/templates/tex/title.tex")[title]
- #link("_extensions/templates/tex/toc.tex")[toc]
- #link("_extensions/templates/tex/before-body.tex")[before-body]
- #link("_extensions/templates/tex/before-bib.tex")[before-bib]
- #link("_extensions/templates/tex/biblio.tex")[biblio]
- #link("_extensions/templates/tex/after-body.tex")[after-body]

And the Pandoc sub-partials:

- #link("_extensions/templates/tex/tightlist.tex")[tightlist]
- #link("_extensions/templates/tex/tables.tex")[tables]
- #link("_extensions/templates/tex/graphics.tex")[graphics]
- #link("_extensions/templates/tex/citations.tex")[citations]

]
, 
title: 
[
PDF
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
#block[
#callout(
body: 
[
- #link("_extensions/templates/html/title-block.html")[title-block]
- #link("_extensions/templates/html/styles.html")[styles]
- #link("_extensions/templates/html/html.template")[html-template]
- #link("_extensions/templates/html/html.styles")[html-styles]
- #link("_extensions/templates/html/toc.html")[toc]
- #link("_extensions/templates/html/metadata.html")[metadata]

]
, 
title: 
[
HTML
]
, 
background_color: 
rgb("#dae6fb")
, 
icon_color: 
rgb("#0758E5")
, 
icon: 
fa-info()
)
]
#pagebreak()
= Resources
<resources>
- #link("https://icons.getbootstrap.com")[Bootstrap Icons] - These are available in Quarto documents using the #strong[Shortcode Font Awesome] style as in `` . (There is also #strong[Shortcode Env];, #strong[Shortcode Meta];, #strong[Shortcode Var];).
- #link("https://plain-text.co/index.html#introduction")[The Plain Person’s Guide to Plain Text Social Science]
- #link("https://quarto.org/docs/reference/")[Quarto Reference]
- The easiest way to #link("quarto.org/docs/publishing/github-pages.html#render-to-docs")[publish to Github Pages]
- #link("https://github.com/jjallaire/hopr/blob/master/_quarto.yml")[Example of Quarto Book]
- #link("https://tarleb.com/posts/quarto-with-gh-pages/")[Quarto with GH Pages]

#pagebreak()
= Final word
<final-word>
If you like what you see, consider sponsoring #link("https://github.com/sponsors/bcdavasconcelos")[this project on Github];.

#block[
#callout(
body: 
[
- Compilation fails for #strong[LaTeX → PDF] when citations are placed in Table/Figure captions. The cause seems to be the #strong[Citation Backlinks] filter.
- For #strong[Typst → PDF] output some #strong[Quarto] features (#emph[e.g.] margin notes, column classes) are not yet implemented. Hopefully this will change in future Quarto versions.

]
, 
title: 
[
Known problems & random errors
]
, 
background_color: 
rgb("#fcefdc")
, 
icon_color: 
rgb("#EB9113")
, 
icon: 
fa-exclamation-triangle()
)
]
#pagebreak()
#block[
#heading(
level: 
1
, 
numbering: 
none
, 
[
Bibliography
]
)
]
#block[
#heading(
level: 
2
, 
numbering: 
none
, 
[
Primary Sources
]
)
]
#block[
#block[
ARISTOTELIS. “De Anima”. Em: BEKKER, I. (Ed.). #emph[Aristotelis Opera];. Trad.: Β. Τατάκης. Berlin: Reimer, 1834.

] <ref-DA>
#block[
HOMERUS. “Ilias”. Em: ALLEN, T. W. (Ed.). #emph[Homeri Ilias, vols. 2–3];. Oxford: Clarendon, 1931. p. 2·1-356; 3·1-370. \[#link(<cite_2>)[1];\]

] <ref-HomIl>
] <refs_primary-sources>
#block[
#heading(
level: 
2
, 
numbering: 
none
, 
[
Secondary Sources
]
)
]
#block[
#block[
ARISTOTELIS. #emph[De Anima];. Ed: W. Biehl. Leipzig: Teubner, 1896.

] <ref-DABiehl>
#block[
ARISTOTELIS. #emph[De Anima];. Ed: W. Biehl. Trads.: Willy Theiler & Horst Seidl. Harmburg: Felix Meiner, 1995.

] <ref-DATheiler>
#block[
LONG, C. #emph[Ethics of Ontology];. Albany: SUNY, 2004. \[#link(<cite_3>)[1];, #link(<cite_4>)[2];, #link(<cite_5>)[3];, #link(<cite_6>)[4];, #link(<cite_7>)[5];, #link(<cite_8>)[6];, #link(<cite_9>)[7];\]

] <ref-Long2004>
] <refs_secondary-sources>
#block[
#heading(
level: 
2
, 
numbering: 
none
, 
[
Workflow
]
)
]
#block[
#block[
HOFFMAN, D. D.; PRAKASH, C. #link("https://doi.org/10.3389/fpsyg.2014.00577")[Objects of consciousness];. #emph[Frontiers in Psychology];, v. 5, p. 577, 2014. \[#link(<cite_10>)[1];\]

] <ref-hoffman2014>
] <refs_workflow>
#block[
#heading(
level: 
2
, 
numbering: 
none
, 
[
Songs
]
)
]
#block[
#block[
MORPHINE et al. #emph[Cure For Pain];. : Cure For Pain.Rykodisc, 1993. Disponível em: \<#link("https://open.spotify.com/track/3hO9gaVixKDoYDrlTBrEWf?si=0668baf1aab345d4");\> \[#link(<cite_11>)[1];\]

] <ref-MorphineCFP>
] <refs_songs>
#block[
#heading(
level: 
2
, 
numbering: 
none
, 
[
Paintings
]
)
]
#block[
#block[
DRAPER, H. J. #emph[Ulysses and the Sirens];., 1909. \[#link(<cite_37>)[1];\]

] <ref-Draper1909>
] <refs_paintings>



