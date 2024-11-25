# Instalation {id=""   }


To use ScrivQ24, you need the [Quarto](https://quarto.org/docs) open-source scientific and technical publishing system. 


:::{.callout-tip}
## Quickstart

- On macOS[^fn1], use [Homebrew](https://brew.sh) to `brew install quarto && brew install chromium`.
- On Windows, use [Chocolatey](https://chocolatey.org/) to `choco install quarto`.

After that, install TinyTex with `quarto install tool tinytex`.
:::


:::{.callout-tip}
## New to Quarto?
  
- Visit the [get started](https://quarto.org/docs/get-started/) guide to download.
- Check the [tutorial](https://quarto.org/docs/get-started/hello/vscode.html) to learn how to create, build, and preview documents. 
- Install the Quarto extension for [VS Code](https://quarto.org/docs/get-started/#quarto-for-vs-code) and [R Studio](https://quarto.org/docs/get-started/#quarto-for-rstudio).
- Find out more at [Awesome Quarto](https://github.com/mcanouil/awesome-quarto), [Quarto Extensions](https://github.com/quarto-ext?type=source), [Quarto on Github](https://github.com/search?q=topic%3Aquarto&type=repositories), [RStudio Community](https://community.rstudio.com/tags/quarto), [Stack Overflow](https://stackoverflow.com/questions/tagged/quarto), [Twitter](https://twitter.com/quarto_pub).
- See also the [Pandoc User's Guide](https://pandoc.org/MANUAL.html), [Pandoc-Discuss](https://github.com/jgm/pandoc/discussions), and [Pandoc at Stack Overflow](https://stackoverflow.com/questions/tagged/pandoc).
:::


:::{.callout-important}
## Installation issues

Run a `quarto check` on your installation. 

Some Python and R computations will require additional packages (cf. [@wrn-r-packages]).
:::



 


:::{id="wrn-r-packages" .callout-warning   width="" height=""}
## Dependencies for computations

To run R computations, install [R](https://www.r-project.org), [R Studio](https://posit.co/download/rstudio-desktop/), and (*at least*) the following packages:

```{#lst-r-packages .r lst-cap="Additional R packages."}
py_install(packages = "matplotlib")
install.packages("reticulate")
install.packages("markdown")
install.packages("tidyverse")
install.packages("kableExtra")
install.packages("downlit")
install.packages("xml2")
```
:::


# ScrivQ {id=""   }


The ScrivQ template is designed to compile [Quarto Books](https://quarto.org/docs/books/) (PDF[^fn2], DOCX, and HTML) with zero configuration and no dependencies on external files. The bibliography, the template files, extensions, and filters are all included in the project and will be created by the compiler script.


:::{.callout-tip}
## When Quarto is installed...

Hit `Cmd + Opt + E` to publish your Quarto Book right away.
:::


:::{.callout-note}
## ScrivQ

- **Download** the [latest release](https://github.com/bcdavasconcelos/ScrivQ/releases). 
- **Sponsor** [this project](https://github.com/sponsors/bcdavasconcelos).
- **Take part** in the discussion at the [Scrivener forum](https://forum.literatureandlatte.com/t/scrivq-a-template-to-control-quarto-export-multiple-files-manage-bibliography-and-easily-create-cross-references/134755). 
:::


:::{.callout-note}
## Thank you

[\@iandol](https://github.com/iandol) for the exceptional [Scrivomatic](https://github.com/iandol/scrivomatic) from which ScrivQ descended.

Check his [writing in Scrivener tutorial](https://github.com/iandol/scrivomatic#writing-in-scrivener), if you haven't done so yet.
:::



# Compiler Script {id=""   }


![There is a ruby script to reformat the text and create the dependencies. It allows you to pass a file name and a format, so you can edit the post-processing panel to change the output format (*e.g.* change `html` to `pdf` / `docx` / `epub` etc.). It is embedded in this project's Compiler format.  {#fig-scriv-compile width="auto"}][screencap]

The script's output is redirected `&>` to a `Quarto.log` file that will be automatically opened when an error happens and no output is produced. If everything runs smoothly, however, you should see only the output file open.

This compiler script descends from [**Scrivomatic**](https://github.com/iandol/scrivomatic), but with several changes to allow splitting the final document into sub-files. This task entails some challenges as footnotes and image references must be moved around before the file is split. Check the compiler script to see how this got solved and please report any errors.

:::{.callout-warning}
[Ruby](https://www.ruby-lang.org/en/downloads) must be installed on Windows machines.
:::




# Citations {id=""   }


:::{.column-margin}
Μῆνιν ἄειδε, θεά, Πηληιάδεω Ἀχιλῆος ([@HomIl, I 1])
The wrath sing, goddess, of Peleus' son Achilles.
:::


In ScrivQ, we use [Citeproc](https://en.wikipedia.org/wiki/CiteProc) to handle the bibliography and provide consistent output across different formats. Given Citeproc's lack of features beloved by **BibTeX** users, we included [Cite Tools](https://bcdavasconcelos.github.io/citetools) to enable multipart bibliographies, provide backlinks (see `backref` from [HyperRef](www.ctan.org/pkg/hyperref)), and access bibliographic data from sources (*author*, *editor*, *translator*, *date*, *edition*, *number*, and so on).


:::{.callout-note}
## Official documentation
 
The official documentation on citations can be found at [Pandoc](pandoc.org/MANUAL.html#citations) and [Quarto](quarto.org/docs/authoring/footnotes-and-citations.html#sec-citations).
:::


:::{.callout-warning}
## Cite Tools and ScrivQ

Deleting [Cite Tools](https://bcdavasconcelos.github.io/citetools) might cause the compilation to [fail]{.underline}.
:::


:::{.callout-tip}
## Using **Cite Tools **in other projects 

`quarto install extension bcdavasconcelos/citetools`.
:::




## Basic citations {id=""   }


1. The citation syntax is straightforward: `@Citekey` for **Author (Date)** (an *in-text* citation); `[@Citekey]` for **Author, Date**; and `[-@Citekey]` for **Date**. 

2. The citation key is optionally followed by a locator, which can be a page number, a line number, a chapter number, or a section number, preceded by a comma, *e.g.* `[@Citekey, p.10]`. 

3. Multiple citations can be grouped in brackets separated by semicolons `[@CitekeyA; @CitekeyB]`. The CSL style used by Citeproc will determine the presence (or absence) of parenthesis around the rendered citation. (We favor a style that doesn't use parenthesis, but that is up to you.) 


| **Character Style** | **Markdown Source** | **Rendered output**[^fn3] |
| :-----: | :-----: | :-----: |
| **Cite*** | `[-@Long2004]` | [-@Long2004] |
| **Cite*** | `[-@Long2004, p.15]` | [-@Long2004, p.15] |
| **Cite** | `[@Long2004]` | [@Long2004] |
| **Cite** | `[@Long2004, p.15]` | [@Long2004, p.15] |

Table: Citation syntax in Quarto and Pandoc. {#tbl-citations}



Here is a short demonstration of the basic citation feature. We suggest grouping the citations using parenthesis and using character styles to apply the correct markup. If you were using other CSL styles, then you could drop the parenthesis.

:::{.callout-note}
## (Date, locator)
 
Long thinks [...] on the deliberations of the prudent person ([-@Long2004, p.17]).
:::


:::{.callout-note}
## (Author, Date, locator)

...on the deliberations of the prudent person ([@Long2004, p.17]).
:::


:::{.callout-note}
## (Author, Date, locator; Author, Date, locator)

...on the deliberations of the prudent person ([@Long2004, p.17]; [@hoffman2014, p.15]).
:::



## Citation of specific fields {id=""   }


To inject the correct markup -- `[@Citekey]{.csl_field}` -- and allow us to cite different fields from our bibliographic entry, we rely on **Character Styles** (*e.g.* *Cite Author*, *Cite Editor*, *Cite Issued*, and so on). [Officially, [CSL has Variables](https://docs.citationstyles.org/en/stable/specification.html#appendix-iv-variables), [BibTeX has Fields](https://en.wikipedia.org/wiki/BibTeX#Field_types), and [RIS has Tags](https://en.wikipedia.org/wiki/RIS_(file_format)#Tags), but we stuck to the term fields to describe all of them.]{.aside}


| Character Style | Markdown Source | Rendered Output |
| :-----: | :-----: | :-----: |
| Cite Author | `[@DA]{.author}` | [@DA]{.author} |
| Cite Editor | `[@DA]{.editor}` | [@DA]{.editor} |
| Cite Translator | `[@DA]{.translator}` | [@DA]{.translator} |
| Cite Issued | `[@DA]{.issued}` | [@DA]{.issued} |
| Cite Title | `[@DA]{.title}` | [@DA]{.title} |
| Cite Title-short | `[@DA]{.title-short}` | [@DA]{.title-short} |
| Cite Original-title | `[@DA]{.original-title}` | [@DA]{.original-title} |
| Cite Publisher | `[@DA]{.publisher}` | [@DA]{.publisher} |
| Cite Publisher-Place | `[@DA]{.publisher-place}` | [@DA]{.publisher-place} |

Table: All ready-made **Character Styles** for the Cite Field lua filter. {#tbl-cite-field}


:::{.callout-note}
## An example with field citation

[@DA]{.editor} published the first modern edition of Aristotle's [@DA]{.original-title} ([@DA]{.title}) in [@DA]{.issued}. A new edition by [@DABiehl]{.editor} appeared in [@DABiehl]{.issued} (later reprinted in [@DATheiler]{.translator}'s [@DATheiler]{.issued} translation).
:::



## Multipart Bibliography {id=""   }



:::{.callout-tip}
## Where do I plug my bibliography?
 
There is no need to keep **separate bibliography files** in the system. Simply **copy and paste the references directly to Scrivener** following the instructions below.
:::


:::{.callout-tip}
## References format

**Pandoc** and **Quarto** use a [CSL](https://docs.citationstyles.org/en/stable/specification.html) (*Citation Style Language*) engine and prefer [CSL-YAML and CSL-JSON](https://docs.citationstyles.org/en/stable/specification.html) (performing up to 10x faster) over [BibTeX](https://en.wikipedia.org/wiki/BibTeX#Entry_types) and [RIS](https://en.wikipedia.org/wiki/RIS_(file_format)#Type_of_reference), which need to be converted before they can be understood.
:::


:::{.callout-tip}
## What if I don't have a bibliography ready?
 
- Check [Zotero](www.zotero.org)[^fn4] and [JabRef](www.jabref.org) on all platforms.
- On macOS, check [Bookends](www.sonnysoftware.com/) and [Bibdesk](bibdesk.sourceforge.io); 
- See also [this comparison](en.wikipedia.org/wiki/Comparison_of_reference_management_software). 
:::


[BibTeX]: 
[CSL]: https://docs.citationstyles.org/en/stable/specification.html#appendix-iii-types
[CSL-YAML]: https://docs.citationstyles.org/en/stable/specification.html
[CSL-JSON]: https://docs.citationstyles.org/en/stable/specification.html
[RIS]: https://en.wikipedia.org/wiki/RIS_(file_format)#Type_of_reference

### How to manually create a multipart bibliography {id="nte-multibib1" .callout-note  }


1. Using the **Section Type** `File`, we create a representation of our bibliography file to add the data (*e.g.* [Primary Sources](refs/primary-sources.yml) and [Secondary Sources](refs/secondary-sources.yml)).
2. On the Metadata panel we set the relative path (`ID-Prefix` + `ID`) and the extension (`Extension`) of the actual bibliography file that will be created upon **Compile**.

![The Metadata panel {#fig-bibliography width="auto"}][BibliographyFile]

3. We need to tell Quarto about the bibliography file by adding it to the [_quarto](_quarto.yml) configuration file (there is a bibliography section), then we can print the formatted bibliography using the ID (*e.g.* "primary-sources") with the **Paragraph Style** *Div Bibliography*.



::: {#refs_primary-sources}
:::



### How to automatically create a multipart bibliography {id="nte-multibib2" .callout-note  }


We can use the **Section Type** Bibliography to automate steps 3 and 4. This is very convenient for books that need the bibliography to print only once at the very end.


1. Using the **Section Type** `File`, we create a representation of our bibliography file to add the data (*e.g.* [Primary Sources](refs/primary-sources.yml) and [Secondary Sources](refs/secondary-sources.yml)).
2. On the Metadata panel we set the relative path (`ID-Prefix` + `ID`) and the extension (`Extension`) of the actual bibliography file that will be created upon **Compile**.
3. The metadata with the file path will be automatically added and the formatted bibliography will be printed in the same section as the data, with the same section title.

## Backlinks {id=""   }


In Citeproc, `link-citations` control whether citations in the body of the text should be clickable links to the reference in the bibliography. **Cite Tools** takes it further and adds a backlink to each citation an entry has received in the document in a crescent ordinal fashion[^fn5]. This allows the reader to easily arrive at sections of the text where the same reference was discussed and quickly see how many times each reference was used with the array of backlinks.

![The **Citation Backlinks** filter adds an index of cited references to the bibliography, with links back to all in-text citations. It also allows the user to turn these off globally or in an *ad hoc* fashion. {#fig-scrivlinkC width="auto"}][backrefs]

:::{.callout-tip}
## Citing specific fields
 
Turn `link-fields` into false to avoid undesired linking
:::


:::{.callout-note}
## Bibliography links

- [link-citations]{.underline}: Hyperlink citations to the corresponding bibliography entries. Defaults to true.
- [link-fields]{.underline}: Hyperlink citations targeting specific CSL fields to the corresponding entries in the bibliography. Defaults to true.
- [link-bibliography]{.underline}: Hyperlink DOIs, PMCIDs, PMID, and URLs in bibliographies. Defaults to true.
- [lang]{.underline}: Affects the bibliography tags. Defaults to `en-US`.
:::




# Quarto {id=""   }


:::{.column-margin}
"I propose a toast, to my self-control. You see it helpless, crawling on the floor."
[@MorphineCFP]{.author}, [@MorphineCFP]{.title} ([-@MorphineCFP])
:::



## Scrivener Project Templates {id=""   }


All sorts of internal **Scrivener Templates** have been included for convenience. They serve as starting points to create new sections. Click **Project > New From Template** and select the desired **Section Types** from the list, which includes `Bibliography`, `Code`, `Computation`, `Diagram Dot`, `Diagram Mermaid`, `Div`, `Equation`, `File`, `Metadata`, `Section`, `Text`, `Text (Anchored)`[^fn6]. 

This provides a huge number of options as the metadata can be edited to allow the creation of different **Quarto** elements and their customization (*e.g.* using classes and attributes). Using the **Section Type** `Div`, for example, one could create 8 different **Amsthm** elements, 5 different **Callouts**, and several **Column** environments. Using the `Computation`, one can create executable code blocks with R, Python, and Ruby. The **Section Type** `Section` can be numbered, unnumbered, or part of the appendix (with the use of classes). 

Look at the ready-made examples to see what else is possible.


## Cross-referencing {id=""   }


When creating a **Section**, select the correct `ID-Prefix` (*e.g.* `sec-`) and fill the `ID` metadata field with a value (*e.g.* `xref`). Then, **use Scrivener placeholders** ( `<\$Custom:ID-Prefix><\$Custom:ID>`) with a link to the cited element, so that this gets replaced with `sec-xref`. This works regardless of the element being cross-referenced (*e.g.* *section*, *table*, *figure*, *listing*) because this strategy ensures the citation will use the `<\$Custom:ID-Prefix>` pulled from the targeted element (*e.g.* `sec-`, `tbl-`, `fig-`, `lst-`), making it compatible with all element types. 

:::{.callout-warning}
## Alternative to placeholders

A less verbose option uses a replacement rule:

- `s\crivlink` is replaced with `<\$Custom:ID-Prefix><\$Custom:ID>`.
- `s\crivpath` and `$\!` are replaced with `<\$Custom:ID-Prefix><\$Custom:ID><\$Custom:Extension>`.
:::


:::{.callout-tip}
## How to cross-reference an element
 
1. Type [your-keyword-of-choice]{.underline} or `s\crivlink`;
2. Apply the **Character Style** *Cite* (**hit** `Shift + Command + Y`)
3. Link to the document that contains the element (**hit** [Command + L]{.underline}).
:::


:::{.callout-caution}
## Known limitation
 
Understand that **Scrivener Placeholders** can only pull information from the section properties, so the generic link label (*e.g.* `s\crivlink`) will work to reference elements created from **Section Types**.
 
To reference elements created from **Raw Markup** or **Character Style**, use the actual `ID` given (*e.g.* `fig-ulysses`).
:::



## Amsthm {id=""   }



| **Species** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: |
| Conjecture | `[@cnj-demo]` | [@cnj-demo] |
| Corollary | `[@cor-demo]` | [@cor-demo] |
| Definition | `[@def-demo]` | [@def-demo] |
| Example | `[@exm-demo]` | [@exm-demo] |
| Exercise | `[@exr-demo]` | [@exr-demo] |
| Lemma | `[@lem-demo]` | [@lem-demo] |
| Proposition | `[@prp-demo]` | [@prp-demo] |
| Theorem | `[@thm-demo]` | [@thm-demo] |

Table: Cross-referencing **Amsthm** elements in ScrivQ. {#tbl-amsthm}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

:::{id="cnj-demo"    width="" height=""}
Demonstration of the **Conjecture** theorem environment using the **Section Type** `Div` with **ID** `#cnj-demo`.

:::


:::{id="cor-demo"    width="" height=""}
Demonstration of the **Corollary** theorem environment using the **Section Type** `Div` with **ID** `#cor-demo`.

:::


:::{id="def-demo"    width="" height=""}
Demonstration of the **Definition** theorem environment using the **Section Type** `Div` with **ID** `#def-demo`.

:::


:::{id="exm-demo"    width="" height=""}
Demonstration of the **Example** theorem environment using the **Section Type** `Div` with **ID** `#exm-demo`.

:::


:::{id="exr-demo"    width="" height=""}
Demonstration of the **Exercise** theorem environment using the **Section Type** `Div` with **ID** `#exr-demo`.

:::


:::{id="lem-demo"    width="" height=""}
Demonstration of the **Lemma** theorem environment using the **Section Type** `Div` with **ID** `#lem-demo`.

:::


:::{id="prp-demo"    width="" height=""}
Demonstration of the **Proposition** theorem environment using the **Section Type** `Div` with **ID** `#prp-demo`.

:::


:::{id="thm-demo"    width="" height=""}
Demonstration of the **Theorem** theorem environment using the **Section Type** `Div` with **ID** `#thm-demo`.

$$[ x^2 + y^2 = z^2 ]$$
:::


## Callouts {id=""   }



| **Species** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: |
| Caution | `[@cau-caution]` | [@cau-caution] |
| Important | `[@imp-important]` | [@imp-important] |
| Note | `[@nte-note]` | [@nte-note] |
| Tip | `[@tip-tip]` | [@tip-tip] |
| Warning | `[@wrn-warning]` | [@wrn-warning] |

Table: Cross-referencing callouts. {#tbl-callouts}

Using styles, you can create normal or collapsed callouts.


:::{.callout-caution collapse="true"}
## Caution (collapsed)

This is a Callout Caution using a **Paragraph Style**.
:::


:::{.callout-caution}
## Caution

This is a Callout Caution using a **Paragraph Style**.
:::



:::{id="cau-caution" .callout-caution appearance="simple"  width="" height=""}
Demonstration of a **Callout Caution** using the **Section Type** `Div` with class `.callout-caution` and with **ID** `#cau-caution`.
:::


:::{id="imp-important" .callout-important appearance="simple"  width="" height=""}
Demonstration of a **Callout Important** using the **Section Type** `Div` with class `.callout-important` and with **ID** `#imp-important`.
:::


:::{id="nte-note" .callout-note appearance="simple"  width="" height=""}
Demonstration of a **Callout Note** using the **Section Type** `Div` with class `.callout-note` and with **ID** `#nte-note`.
:::


:::{id="tip-tip" .callout-tip appearance="simple"  width="" height=""}
Demonstration of a **Callout Tip** using the **Section Type** `Div` with class `.callout-tip` and with **ID** `#tip-tip`.
:::


:::{id="wrn-warning" .callout-warning appearance="simple"  width="" height=""}
Demonstration of a **Callout Warning** using the **Section Type** `Div` with class `.callout-warning` and with **ID** `#wrn-warning`.
:::


## Diagrams {id=""   }


Similarly, we can create **Dot** and **Mermaid** diagrams using **Section Types** (*Diagram Dot*, *Diagram Mermaid*), **Paragraph Styles** (*Diagram Dot*, *Diagram Mermaid*), and **Raw Mardown**.


| **Species** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: |
| Dot | `[@fig-dot-a]` | [@fig-dot-a] |
| Dot | `[@fig-dot-b]` | [@fig-dot-b] |
| Dot | `[@fig-dot-c]` | [@fig-dot-c] |
| Mermaid | `[@fig-mermaid-a]` | [@fig-mermaid-a] |
| Mermaid | `[@fig-mermaid-b]` | [@fig-mermaid-b] |
| Mermaid | `[@fig-mermaid-c]` | [@fig-mermaid-c] |

Table: Cross-referencing **Dot** and **Mermaid** diagrams. {#tbl-diagrams}



```{dot}
//| label: fig-dot-a
//| fig-cap: Figure caption
//| column: page-right
//| echo: false

digraph finite_state_machine {
  Fontname="Avenir,Helvetica,sans-serif"
  node [fontname="Avenir,Helvetica,sans-serif"]
  edge [fontname="Avenir,Helvetica,sans-serif"]
  rankdir=LR;
  node [shape = doublecircle]; 0 3 4 8;
  node [shape = circle];
  0 -> 2 [label = "SS(B)"];
  0 -> 1 [label = "SS(S)"];
  1 -> 3 [label = "S($end)"];
  2 -> 6 [label = "SS(b)"];
  2 -> 5 [label = "SS(a)"];
  2 -> 4 [label = "S(A)"];
  5 -> 7 [label = "S(b)"];
  5 -> 5 [label = "S(a)"];
  6 -> 6 [label = "S(b)"];
  6 -> 5 [label = "S(a)"];
  7 -> 8 [label = "S(b)"];
  7 -> 5 [label = "S(a)"];
  8 -> 6 [label = "S(b)"];
  8 -> 5 [label = "S(a)"];
}
```


```{dot}
//| label: fig-dot-b
//| fig-cap: "A graphviz graph with figure reference and caption, using raw markup. See https://quarto.org/docs/authoring/diagrams.html#sizing for more details..."
//| column: page-right
//| echo: false

digraph regexp { 
 fontname="Helvetica,Arial,sans-serif"
 node [fontname="Helvetica,Arial,sans-serif"]
 edge [fontname="Helvetica,Arial,sans-serif"]
 n0 [label="regexp", URL="https://godoc.org/regexp", tooltip="Package regexp implements regular expression search."];
 n1 [label="bytes", URL="https://godoc.org/bytes", tooltip="Package bytes implements functions for the manipulation of byte slices."];
 n2 [label="io", URL="https://godoc.org/io", tooltip="Package io provides basic interfaces to I/O primitives."];
 n3 [label="regexp/syntax", URL="https://godoc.org/regexp/syntax", tooltip="Package syntax parses regular expressions into parse trees and compiles parse trees into programs."];
 n4 [label="sort", URL="https://godoc.org/sort", tooltip="Package sort provides primitives for sorting slices and user-defined collections."];
 n5 [label="strconv", URL="https://godoc.org/strconv", tooltip="Package strconv implements conversions to and from string representations of basic data types."];
 n6 [label="strings", URL="https://godoc.org/strings", tooltip="Package strings implements simple functions to manipulate UTF-8 encoded strings."];
 n7 [label="sync", URL="https://godoc.org/sync", tooltip="Package sync provides basic synchronization primitives such as mutual exclusion locks."];
 n8 [label="unicode", URL="https://godoc.org/unicode", tooltip="Package unicode provides data and functions to test some properties of Unicode code points."];
 n9 [label="unicode/utf8", URL="https://godoc.org/unicode/utf8", tooltip="Package utf8 implements functions and constants to support text encoded in UTF-8."];
 n10 [label="internal/bytealg", URL="https://godoc.org/internal/bytealg", tooltip=""];
 n11 [label="errors", URL="https://godoc.org/errors", tooltip="Package errors implements functions to manipulate errors."];
 n12 [label="internal/reflectlite", URL="https://godoc.org/internal/reflectlite", tooltip="Package reflectlite implements lightweight version of reflect, not using any package except for \"runtime\" and \"unsafe\"."];
 n13 [label="math", URL="https://godoc.org/math", tooltip="Package math provides basic constants and mathematical functions."];
 n14 [label="math/bits", URL="https://godoc.org/math/bits", tooltip="Package bits implements bit counting and manipulation functions for the predeclared unsigned integer types."];
 n15 [label="unsafe", URL="https://godoc.org/unsafe", tooltip="Package unsafe contains operations that step around the type safety of Go programs."];
 n16 [label="internal/race", URL="https://godoc.org/internal/race", tooltip="Package race contains helper functions for manually instrumenting code for the race detector."];
 n17 [label="runtime", URL="https://godoc.org/runtime", tooltip=""];
 n18 [label="sync/atomic", URL="https://godoc.org/sync/atomic", tooltip="Package atomic provides low-level atomic memory primitives useful for implementing synchronization algorithms."];
 n19 [label="internal/cpu", URL="https://godoc.org/internal/cpu", tooltip="Package cpu implements processor feature detection used by the Go standard library."];
 n0 -> n1;
 n0 -> n2;
 n0 -> n3;
 n0 -> n4;
 n0 -> n5;
 n0 -> n6;
 n0 -> n7;
 n0 -> n8;
 n0 -> n9;
 n1 -> n10;
 n1 -> n2;
 n1 -> n8;
 n1 -> n9;
 n1 -> n11;
 n2 -> n11;
 n2 -> n7;
 n3 -> n4;
 n3 -> n5;
 n3 -> n6;
 n3 -> n8;
 n3 -> n9;
 n4 -> n12;
 n5 -> n10;
 n5 -> n13;
 n5 -> n9;
 n5 -> n11;
 n5 -> n14;
 n6 -> n2;
 n6 -> n7;
 n6 -> n15;
 n6 -> n11;
 n6 -> n10;
 n6 -> n8;
 n6 -> n9;
 n7 -> n16;
 n7 -> n17;
 n7 -> n18;
 n7 -> n15;
 n10 -> n19;
 n10 -> n15;
 n11 -> n12;
 n12 -> n17;
 n12 -> n15;
 n13 -> n15;
 n13 -> n19;
 n13 -> n14;
 n14 -> n15;
 n16 -> n15;
 n18 -> n15;
}
```

```{dot}
//| label: fig-dot-c
//| fig-cap: "Color wheel diagram"
//| 
//| column: page-right
graph Color_wheel {
	graph [
		layout = neato
		label = "Color wheel, 33 colors.\nNeato layout"
		labelloc = b
		fontname = "Helvetica,Arial,sans-serif"
		start = regular
		normalize = 0
	]
	node [
		shape = circle
		style = filled
		color = "#00000088"
		fontname = "Helvetica,Arial,sans-serif"
	]
	edge [
		len = 2.7
		color = "#00000088"
		fontname = "Helvetica,Arial,sans-serif"
	]
	subgraph Dark {
		node [fontcolor = white width = 1.4]
		center [width = 1 style = invis shape = point]
		center -- darkred [label = "0°/360°"]
		darkred [fillcolor = darkred]
		brown [fillcolor = brown]
		brown -- center [label = "30°"]
		olive [fillcolor = olive]
		olive -- center [label = "60°"]
		darkolivegreen [fillcolor = darkolivegreen fontsize = 10]
		darkolivegreen -- center [label = "90°"]
		darkgreen [fillcolor = darkgreen]
		darkgreen -- center [label = "120°"]
		"dark hue 0.416" [color = ".416 1 .6" fontcolor = white]
		"dark hue 0.416" -- center [label = "150°"]
		darkcyan [fillcolor = darkcyan]
		darkcyan -- center [label = "180°"]
		"dark hue 0.583" [color = ".583 1 .6" fontcolor = white]
		"dark hue 0.583" -- center [label = "210°"]
		darkblue [fillcolor = darkblue]
		darkblue -- center [label = "240°"]
		"dark hue 0.750" [color = ".750 1 .6"]
		"dark hue 0.750" -- center [label = "270°"]
		darkmagenta [fillcolor = darkmagenta]
		darkmagenta -- center [label = "300°"]
		"dark hue 0.916" [color = ".916 1 .6"]
		"dark hue 0.916" -- center [label = "330°"]
	}
	subgraph Tue {
		node [width = 1.3]
		"hue 0.083" -- brown
		"hue 0.083" [color = ".083 1 1"]
		"hue 0.125" [color = ".125 1 1"]
		"hue 0.166" -- olive
		"hue 0.166" [color = ".166 1 1"]
		"hue 0.208" [color = ".208 1 1"]
		"hue 0.250" -- darkolivegreen
		"hue 0.250" [color = ".250 1 1"]
		"hue 0.291" [color = ".291 1 1"]
		"hue 0.333" -- darkgreen
		"hue 0.333" [color = ".333 1 1"]
		"hue 0.375" [color = ".375 1 1"]
		"hue 0.416" -- "dark hue 0.416"
		"hue 0.416" [color = ".416 1 1"]
		"hue 0.458" [color = ".458 1 1"]
		"hue 0.500" -- darkcyan
		"hue 0.500" [color = ".500 1 1"]
		"hue 0.541" [color = ".541 1 1"]
		node [fontcolor = white]
		"hue 0.000" [color = ".000 1 1"]
		"hue 0.000" -- darkred
		"hue 0.041" [color = ".041 1 1"]
		"hue 0.583" -- "dark hue 0.583"
		"hue 0.583" [color = ".583 1 1"]
		"hue 0.625" [color = ".625 1 1"]
		"hue 0.666" -- darkblue
		"hue 0.666" [color = ".666 1 1"]
		"hue 0.708" [color = ".708 1 1"]
		"hue 0.750" -- "dark hue 0.750"
		"hue 0.750" [color = ".750 1 1"]
		"hue 0.791" [color = ".791 1 1"]
		"hue 0.833" -- darkmagenta
		"hue 0.833" [color = ".833 1 1"]
		"hue 0.875" [color = ".875 1 1"]
		"hue 0.916" -- "dark hue 0.916"
		"hue 0.916" [color = ".916 1 1"]
		"hue 0.958" [color = ".958 1 1"]
		edge [len = 1]
		"hue 0.000" -- "hue 0.041" -- "hue 0.083" -- "hue 0.125" -- "hue 0.166" -- "hue 0.208"
		"hue 0.208" -- "hue 0.250" -- "hue 0.291" -- "hue 0.333" -- "hue 0.375" -- "hue 0.416"
		"hue 0.416" -- "hue 0.458" -- "hue 0.500" --"hue 0.541" -- "hue 0.583" -- "hue 0.625"
		"hue 0.625" -- "hue 0.666" -- "hue 0.708" -- "hue 0.750" -- "hue 0.791" -- "hue 0.833"
		"hue 0.833" -- "hue 0.875" -- "hue 0.916" -- "hue 0.958" -- "hue 0.000"
	}
	subgraph Main_colors {
		node [width = 2 fontsize = 20]
		red [fillcolor = red fontcolor = white]
		orangered [fillcolor = orangered]
		orange [fillcolor = orange]
		gold [fillcolor = gold]
		yellow [fillcolor = yellow]
		yellowgreen [fillcolor = yellowgreen]
		deeppink [fillcolor = deeppink fontcolor = white]
		fuchsia [label = "fuchsia\nmagenta" fillcolor = fuchsia fontcolor = white]
		purple [fillcolor = purple fontcolor = white]
		blue [fillcolor = blue fontcolor = white]
		cornflowerblue [fillcolor = cornflowerblue]
		deepskyblue [fillcolor = deepskyblue]
		aqua [fillcolor = aqua label = "aqua\ncyan"]
		springgreen [fillcolor = springgreen]
		green [fillcolor = green]
		purple -- fuchsia -- deeppink -- red
		cornflowerblue -- blue -- purple
		cornflowerblue -- deepskyblue -- aqua [len = 1.7]
		aqua -- springgreen -- green -- yellowgreen -- yellow
		yellow -- gold -- orange -- orangered -- red [len = 1.6]
		orange -- "hue 0.083"
		deeppink -- "hue 0.916"
		deeppink -- "hue 0.875"
		red -- "hue 0.000"
		yellowgreen -- "hue 0.250"
		blue -- "hue 0.666"
		yellow -- "hue 0.166"
		gold -- "hue 0.125"
		green -- "hue 0.333"
		springgreen -- "hue 0.416"
		aqua -- "hue 0.500"
		cornflowerblue -- "hue 0.583"
		deepskyblue -- "hue 0.541"
		purple -- "hue 0.791"
		purple -- "hue 0.750"
		fuchsia -- "hue 0.833"
	}
	subgraph Light_colors {
		node [width = 2 fontsize = 20]
		node [shape = circle width = 1.8]
		edge [len = 2.1]
		pink [fillcolor = pink]
		pink -- red
		lightyellow [fillcolor = lightyellow]
		lightyellow -- yellow
		mediumpurple [fillcolor = mediumpurple]
		mediumpurple -- purple
		violet [fillcolor = violet]
		violet -- fuchsia
		hotpink [fillcolor = hotpink]
		hotpink -- deeppink
		"light hue 0.250" [color = ".250 .2 1"]
		"light hue 0.250" -- yellowgreen
		lightcyan [fillcolor = lightcyan]
		lightcyan -- aqua
		lightslateblue [fillcolor = lightslateblue]
		lightslateblue -- blue
		lightgreen [fillcolor = lightgreen]
		lightgreen -- green
		lightskyblue [fillcolor = lightskyblue]
		lightskyblue -- deepskyblue
		peachpuff [fillcolor = peachpuff]
		peachpuff -- orange
		"light hue 0.416" [color = ".416 .2 1"]
		"light hue 0.416" -- springgreen
	}
	subgraph Tints {
		node [width = 1]
		edge [len = 2.4]
		"hue 0 tint" -- pink
		"hue 0 tint" [color = "0 .1 1"]
		"hue 0.041 tint" [color = ".041 .1 1"]
		"hue 0.083 tint" -- peachpuff
		"hue 0.083 tint" [color = ".083 .1 1"]
		"hue 0.125 tint" [color = ".125 .1 1"]
		"hue 0.166 tint" -- lightyellow
		"hue 0.166 tint" [color = ".166 .1 1"]
		"hue 0.208 tint" [color = ".208 .1 1"]
		"hue 0.250 tint" -- "light hue 0.250"
		"hue 0.250 tint" [color = ".250 .1 1"]
		"hue 0.291 tint" [color = ".291 .1 1"]
		"hue 0.333 tint" -- lightgreen
		"hue 0.333 tint" [color = ".333 .1 1"]
		"hue 0.375 tint" [color = ".375 .1 1"]
		"hue 0.416 tint" -- "light hue 0.416"
		"hue 0.416 tint" [color = ".416 .1 1"]
		"hue 0.458 tint" [color = ".458 .1 1"]
		"hue 0.5 tint" -- lightcyan
		"hue 0.5 tint" [color = ".5 .1 1"]
		"hue 0.541 tint" -- lightskyblue
		"hue 0.541 tint" [color = ".541 .1 1"]
		"hue 0.583 tint" [color = ".583 .1 1"]
		"hue 0.625 tint" [color = ".625 .1 1"]
		"hue 0.666 tint" -- lightslateblue
		"hue 0.666 tint" [color = ".666 .1 1"]
		"hue 0.708 tint" [color = ".708 .1 1"]
		"hue 0.750 tint" -- mediumpurple
		"hue 0.750 tint" [color = ".750 .1 1"]
		"hue 0.791 tint" [color = ".791 .1 1"]
		"hue 0.833 tint" -- violet
		"hue 0.833 tint" [color = ".833 .1 1"]
		"hue 0.875 tint" [color = ".875 .1 1"]
		"hue 0.916 tint" -- hotpink
		"hue 0.916 tint" [color = ".916 .1 1"]
		"hue 0.958 tint" [color = ".958 .1 1"]
		edge [len = 2]
		"hue 0 tint" -- "hue 0.041 tint" -- "hue 0.083 tint" -- "hue 0.125 tint" -- "hue 0.166 tint" -- "hue 0.208 tint"
		"hue 0.208 tint" -- "hue 0.250 tint" -- "hue 0.291 tint" -- "hue 0.333 tint" -- "hue 0.375 tint" -- "hue 0.416 tint"
		"hue 0.416 tint" -- "hue 0.458 tint" -- "hue 0.5 tint" --"hue 0.541 tint" -- "hue 0.583 tint" -- "hue 0.625 tint"
		"hue 0.625 tint" -- "hue 0.666 tint" -- "hue 0.708 tint" -- "hue 0.750 tint" -- "hue 0.791 tint" -- "hue 0.833 tint"
		"hue 0.833 tint" -- "hue 0.875 tint" -- "hue 0.916 tint" -- "hue 0.958 tint" -- "hue 0 tint"
	}
	// © 2022 Costa Shulyupin, licensed under EPL
}

```


```{mermaid}
%%| label: fig-mermaid-a
%%| fig-cap: Figure caption



flowchart
    A --> B & C & D --> E & F --> G
```


```{mermaid}
%%| label: fig-mermaid-b
%%| fig-cap: Figure caption
%%| column: page-right
%%| echo: false

flowchart LR
  A{Diagram} --> B[Section Type]
  A --> C[Paragraph Style]
  A --> D[Raw Markdown]
```

```{mermaid}
%%| label: fig-mermaid-c
%%| fig-cap: "A Mermaid figure using a Scrivener Section Type [Computation] with class [mermaid], see https://quarto.org/docs/authoring/diagrams.html for more details"
%%| 
%%| 
%%{init: {"pie": {"textPosition": 0.5}, "themeVariables": {"pieOuterStrokeWidth": "5px"}} }%%
pie showData
    title Key elements in Product X
    "Calcium" : 42.96
    "Potassium" : 50.05
    "Magnesium" : 10.01
    "Iron" :  5

```


## Equations {id=""   }



| **Species** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: |
| Equation | `[@eq-demo-a]` | [@eq-demo-a] |
| Equation | `[@eq-demo-b]` | [@eq-demo-b] |

Table: Cross-referencing **equations**. {#tbl-equations}



$$t' = \frac{t - \dfrac{v}{c^{2}}x}{\sqrt{1 - \dfrac{v^{2}}{c^{2}}}}$$
{#eq-demo-a}


$$t' = \frac{t - \dfrac{v}{c^{2}}x}{\sqrt{1 - \dfrac{v^{2}}{c^{2}}}}
$${#eq-demo-b   }


## Figures {id=""   }



| **Species** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: |
|  | `[@fig-ulysses]` | [@fig-ulysses] |
| Multipart Figure | `[@fig-panel-a]` | [@fig-panel-a] |
| Multipart Figure | `[@fig-panel-a-item-a]` | [@fig-panel-a-item-a] |
| Multipart Figure | `[@fig-panel-a-item-b]` | [@fig-panel-a-item-b] |

Table: Cross-referencing figures. {#tbl-figures}



![Ulysses and the Sirens. {#fig-ulysses width="auto"}][Ulysses-sirens]

Painting by [@Draper1909].


:::{id="fig-panel-a" .column-page  layout-ncol=2 layout-valign="bottom" width="" height=""}

![Place the label first in the caption, and use the `Caption` style. {#fig-panel-a-item-a width="auto"}][Elephant2]

![Angry elephant with a big trunk. {#fig-panel-a-item-b width="auto"}][Elephant3]

This multi-figure panel uses the **Section Type** `Div` instead of raw markdown as shown here. `ID`, `Class`, and `Attributes` specific to the block are saved to `Custom Metadata → ID, Class & Attributes`, and then inserted into the markup for this chunk by the Section Layout at compile time.  

:::


## Listings {id=""   }



| **Species** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: |
| Listing | `[@lst-demo-a]` | [@lst-demo-a] |
| Listing | `[@lst-demo-b]` | [@lst-demo-b] |

Table: Cross-referencing listings. {#tbl-listings}



```{#lst-demo-a lst-cap="Decomposition of Unicode characters." .ruby}
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

```{id="lst-demo-b" lst-cap="The caption" .ruby .numberLines startFrom="1"}
#!/usr/bin/env ruby
# frozen_string_literal: false

Encoding.default_external = Encoding::UTF_8

Dir["#{__dir__}/Ruby/**/*.rb"].each do |file|
  require_relative file
end
```


## Tables {id=""   }



| **Species** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: |
|  | `[@tbl-demo-a]` | [@tbl-demo-a] |
|  | `[@tbl-demo-b]` | [@tbl-demo-b] |
| Multipart Table | `[@tbl-panel-a]` | [@tbl-panel-a] |
| Multipart Table | `[@tbl-panel-a-item-a]` | [@tbl-panel-a-item-a] |
| Multipart Table | `[@tbl-panel-a-item-b]` | [@tbl-panel-a-item-b] |

Table: Cross-referencing tables. {#tbl-tables}




| **GRC** | **SKT** |
| :-----: | :-----: |
| [ἐν ἀρχὴ ἦν ὁ λόγος]{lang=grc} | [आदौ वाद आसीत्]{lang=sa} |

Table: This table with a passage from John 1.1 uses the **Section Type**  [Text]{.underline} and **Paragraph Style** [Table Caption]{.underline}.  {#tbl-demo-a}




| **GRC** | **SKT** |
| :-----: | :-----: |
| [ἐν ἀρχὴ ἦν ὁ λόγος]{lang=grc} | [आदौ वाद आसीत्]{lang=sa} |

: "This is an example of **Section Type** `Table`. The caption and the remaining attributes are added as part of the Section Type markup." {#tbl-demo-b   }


:::{id="tbl-panel-a"    layout-ncol=1 width="" height=""}

| **Element** | **Prefix** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: | :-----: |
| Equation A | eq | A | B |
| Equation A | eq | C | D |
| Listing A | lst | E | F |

Table: The first table of the multipart table panel. {#tbl-panel-a-item-a}


| **Element** | **Prefix** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: | :-----: |
| Equation B | eq | A | B |
| Equation B | eq | C | D |
| Listing B | lst | E | F |

Table: The second table of the multipart table panel. {#tbl-panel-a-item-b}


This is a markdown multi-table panel with two sub-tables generated using a **Section Type** `Div`. The **Custom Metadata** holds the cross-referencing label, classes, and other attributes.

:::


## Sections {id="sec-dem"   }



| **Genus** | **Markdown Source** | **Rendered Output** |
| :-----: | :-----: | :-----: |
| Section | `[@sec-demo-a]` | [@sec-demo-a] |
| Break + Section | `[@sec-demo-e]` | [@sec-demo-e] |
| Heading | `[@sec-demo-c]` | [@sec-demo-c] |
| Break + Heading | `[@sec-demo-d]` | [@sec-demo-d] |

Table: Note that the unnumbered section cannot be referenced.  {#tbl-sections}



### Section (Unnumbered) {id="sec-demo-b" .unnumbered  }


Demonstration of the **Section Type** *Section* using **Class** `.unnumbered`.


### Section {id="sec-demo-a"   }


Demonstration of the **Section Type** *Section* with **ID** `#sec-demo-a`.


{{< pagebreak >}}

### Break + Section {id="sec-demo-e"   }

Demonstration of the **Section Type** *Break + Section* with **ID** `#sec-demo-e`.


### Heading {id="sec-demo-c"   }


---

### Break + Heading {id="sec-demo-d"   }


# Templates and partials {id=""   }


:::{.callout-caution}
## **Quarto** Templates optionally edited in **Scrivener**

Users needing control over the parameters in the native **Quarto** templates shouldn't have to deal with external files. We imported all the templates and partials for the main file types (TeX, HTML, Typst) so they can be edited directly in Scrivener. 
:::


:::{.callout-note collapse="true"}
## PDF
 
- [doc-class](_extensions/templates/tex/doc-class.tex)
- [title](_extensions/templates/tex/title.tex)
- [toc](_extensions/templates/tex/toc.tex) 
- [before-body](_extensions/templates/tex/before-body.tex)
- [before-bib](_extensions/templates/tex/before-bib.tex)
- [biblio](_extensions/templates/tex/biblio.tex)
- [after-body](_extensions/templates/tex/after-body.tex)

And the Pandoc sub-partials:
 
- [tightlist](_extensions/templates/tex/tightlist.tex)
- [tables](_extensions/templates/tex/tables.tex)
- [graphics](_extensions/templates/tex/graphics.tex)
- [citations](_extensions/templates/tex/citations.tex)
:::


:::{.callout-note collapse="true"}
## HTML
 
- [title-block](_extensions/templates/html/title-block.html)
- [styles](_extensions/templates/html/styles.html)
- [html-template](_extensions/templates/html/html.template)
- [html-styles](_extensions/templates/html/html.styles)
- [toc](_extensions/templates/html/toc.html)
- [metadata](_extensions/templates/html/metadata.html)
:::



# Resources {id=""   }


- [Bootstrap Icons](https://icons.getbootstrap.com) - These are available in Quarto documents using the **Shortcode Font Awesome** style as in `{{< fa regular bell >}}` {{< fa regular bell >}}. (There is also **Shortcode Env**, **Shortcode Meta**, **Shortcode Var**). 
- [The Plain Person's Guide to Plain Text Social Science](https://plain-text.co/index.html#introduction)
- [Quarto Reference](https://quarto.org/docs/reference/)
- The easiest way to [publish to Github Pages](quarto.org/docs/publishing/github-pages.html#render-to-docs)
- [Example of Quarto Book](https://github.com/jjallaire/hopr/blob/master/_quarto.yml)
- [Quarto with GH Pages](https://tarleb.com/posts/quarto-with-gh-pages/)

# Final word {id=""   }


If you like what you see, consider sponsoring [this project on Github](https://github.com/sponsors/bcdavasconcelos). 


:::{.callout-warning collapse="true"}
## Known problems & random errors

- Compilation fails for **LaTeX → PDF** when citations are placed in Table/Figure captions. The cause seems to be the **Citation Backlinks** filter.
- For **Typst → PDF** output some **Quarto** features (*e.g.* margin notes, column classes) are not yet implemented. Hopefully this will change in future Quarto versions.
:::




# Bibliography {id="" .unnumbered  }


## Primary Sources {#sec-primary-sources .unnumbered}

---
bibliography_primary-sources: "refs/primary-sources.yml"
---

::: {#refs_primary-sources }
:::

<!-- begin_file: "refs/primary-sources.yml" -->
references:   

- id: AristOp  
  type: book  
  author:   
    - family: Aristotelis  
  editor:   
    - family: Bekker  
      given: I.  
  title: Aristotelis Opera  
  issued:   
    - year: 1834  
  publisher: Reimer  
  publisher-place: Berlin  

- id: DA  
  type: chapter  
  author:   
    - family: Aristotelis  
  editor:   
    - family: Bekker  
      given: Immanuel  
  translator:   
    - family: Τατάκης  
      given: Β.  
  title: De Anima  
  container-title: Aristotelis Opera  
  original-title: περὶ ψυχῆς  
  title-short: De An.  
  issued:   
    - year: 1834  
  publisher: Reimer  
  publisher-place: Berlin  

- id: Men  
  type: book  
  author:   
    - family: Plato  
  editor:   
    - family: Burnet  
      given: John  
  title: Meno  
  container-title: Platonis Opera  
  original-title: Μένων  
  title-short: Men.  
  issued:   
    - year: 1903  
  publisher: OCT  
  publisher-place: Oxford  

- id: HomOd
  type: chapter
  author:
    - family: Homerus
      given: ''
  call-number: '0012.002'
  citation-key: HomOd
  container-title: Homeri Odyssea
  editor:
    - family: Mühll
      given: P.
      non-dropping-particle: von der
  event-place: Basel
  issued:
    - year: 1962
  page: 1-456
  publisher: Helbing & Lichtenhahn
  publisher-place: Basel
  title: Odyssea
  title-short: Hom Od


- id: HomIl
  type: chapter
  title: Ilias
  title-short: Hom Il
  author:
    - family: Homerus
      given: ''
  call-number: '0012.001'
  citation-key: HomIl
  collection-number: 2--3
  container-title: Homeri Ilias, vols. 2--3
  editor:
    - family: Allen
      given: T. W.
  event-place: Oxford
  issued:
    - year: 1931
  page: 2·1-356; 3·1-370
  publisher: Clarendon
  publisher-place: Oxford


- id: EurMed
  title: Medea
  title-short: Eur. Med
  type: chapter
  author:
    - family: Euripides
      given: ''
  call-number: '0006.036'
  citation-key: EurMed
  collection-number: '1'
  container-title: Euripidis fabulae
  editor:
    - family: Diggle
      given: J.
  event-place: Oxford
  issued:
    - year: 1984
  page: 93-155
  publisher: Clarendon
  publisher-place: Oxford


- id: EurHip
  title: Hippolytus
  title-short: Eur. Hip
  type: chapter
  author:
    - family: Euripides
      given: ''
  call-number: '0006.038'
  citation-key: EurHip
  collection-number: '1'
  container-title: Euripidis fabulae
  editor:
    - family: Diggle
      given: J.
  event-place: Oxford
  issued:
    - year: 1984
  publisher: Clarendon
  publisher-place: Oxford

- author:
    - family: Cicero
      given: ''
  collection-number: '40'
  collection-title: Loeb Classical Library
  edition: De Finibus Bonorum et Malorum
  event-place: Cambridge
  issued:
    - year: 1914
  publisher: HUP
  publisher-place: Cambridge
  title: On Ends
  translator:
    - family: Rackham
      given: H.
  type: book
  citation-key: LCL40


<!-- end_file: "refs/primary-sources.yml" -->


## Secondary Sources {#sec-secondary-sources .unnumbered}

---
bibliography_secondary-sources: "refs/secondary-sources.yml"
---

::: {#refs_secondary-sources }
:::

<!-- begin_file: "refs/secondary-sources.yml" -->
references:   
- id: DATheiler  
  type: book  
  author:   
    - family: Aristotelis  
  editor:   
    - family: Biehl  
      given: Wilhelm  
  translator:   
    - family: Theiler  
      given: Willy  
    - family: Seidl  
      given: Horst  
  title: De Anima  
  issued:   
    - year: 1995  
  publisher: Felix Meiner  
  publisher-place: Harmburg  

- id: DABiehl  
  type: book  
  author:   
    - family: Aristotelis  
  editor:   
    - family: Biehl  
      given: Wilhelm  
  title: De Anima  
  issued:   
    - year: 1896  
  publisher: Teubner  
  publisher-place: Leipzig  
  lang: GRC  
- id: Long2004  
  type: book  
  author:   
    - family: Long  
      given: Christopher  
  title: Ethics of Ontology  
  subtitle: Rethinking an aristotelian legacy  
  collection-title: SUNY series in Ancient Greek Philosophy   
  issued:   
    - year: 2004  
  publisher: SUNY  
  publisher-place: Albany  
  lang: ENG  
  keywords:   

- id: Peek1933
  abstract: >-
    Werner Peek Source: Hermes, 68. Bd., H. 1 (1933), pp. 118-121 Published by:
    Franz Steiner Verlag Stable URL: http://www.jstor.org/stable/4474294
    Accessed: 06-01-2016 15:13 UTC
  author:
    - family: Peek
      given: Werner
  call-number: '6'
  citation-key: Peek1933
  container-title: Hermes
  issued:
    - year: 1933
  page: 118-121
  title: Ein attisches Skolion
  type: article-journal
  volume: '68'

- id: IlLourenco
  author:
    - family: Homero
      given: ''
  citation-key: IlLourenco
  event-place: São Paulo
  issued:
    - year: 2013
  publisher: Companhia das Letras
  publisher-place: São Paulo
  title: Ilíada
  translator:
    - family: Lourenço
      given: Frederico
  type: book

- id: OdLourenco
  author:
    - family: Homero
      given: ''
  citation-key: OdLourenco
  event-place: Lisboa
  issued:
    - year: 2018
  number-of-pages: '640'
  publisher: Quetzal
  publisher-place: Lisboa
  title: Odisséia
  translator:
    - family: Lourenço
      given: Frederico
  type: book

<!-- end_file: "refs/secondary-sources.yml" -->


## Workflow {#sec-workflow .unnumbered}

---
bibliography_workflow: "refs/workflow.bib"
---

::: {#refs_workflow }
:::

<!-- begin_file: "refs/workflow.bib" -->
@article{hoffman2014,
author = {Hoffman, Donald D. and Prakash, Chetan}, 
title = {Objects of consciousness}, 
journal = {Frontiers in Psychology}, 
volume = {5}, 
number = {}, 
pages = {577}, 
year = {2014}, 
doi = {10.3389/fpsyg.2014.00577}, 
abstract = {Current models of visual perception typically assume that human vision estimates true properties of physical objects, properties that exist even if unperceived. However, recent studies of perceptual evolution, using evolutionary games and genetic algorithms, reveal that natural selection often drives true perceptions to extinction when they compete with perceptions tuned to fitness rather than truth: Perception guides adaptive behavior; it does not estimate a preexisting physical truth. Moreover, shifting from evolutionary biology to quantum physics, there is reason to disbelieve in preexist-ing physical truths: Certain interpretations of quantum theory deny that dynamical properties of physical objects have defi-nite values when unobserved. In some of these interpretations the observer is fundamental, and wave functions are com-pendia of subjective probabilities, not preexisting elements of physical reality. These two considerations, from evolutionary biology and quantum physics, suggest that current models of object perception require fundamental reformulation. Here we begin such a reformulation, starting with a formal model of consciousness that we call a "conscious agent." We develop the dynamics of interacting conscious agents, and study how the perception of objects and space-time can emerge from such dynamics. We show that one particular object, the quantum free particle, has a wave function that is identical in form to the harmonic functions that characterize the asymptotic dynamics of conscious agents; particles are vibrations not of strings but of interacting conscious agents. This allows us to reinterpret physical properties such as position, momentum, and energy as properties of interacting conscious agents, rather than as preexisting physical truths. We sketch how this approach might extend to the perception of relativistic quantum objects, and to classical objects of macroscopic scale.}, 
location = {}, 
keywords = {consciousness}}


@article{copenhaver2014,
author = {Copenhaver, Rebecca}, 
title = {Berkeley on the Language of Nature and the Objects of Vision}, 
journal = {Res Philosophica}, 
volume = {91}, 
number = {1}, 
pages = {29--46}, 
year = {2014}, 
doi = {}, 
abstract = {Berkeley holds that vision, in isolation, presents only color and light. He also claims that typical perceivers experience distance, figure, magnitude, and situation visually. The question posed in New Theory is how we perceive by sight spatial features that are not, strictly speaking, visible. Berkeley's answer is "that the proper objects of vision constitute an universal language of the Author of nature." For typical humans, this language of vision comes naturally. Berkeley identifies two sorts of objects of vision: primary (light and colors) and secondary (distance, figure, magnitude, and situation). Berkeley also appeals to a third class of a different sort: visible figure, magnitude, and situation, constituting the vocabulary of the language of vision. By considering two perceivers who lack this vocabulary we may better understand this third category and the difference between those who must learn the language of vision and those for whom it is a natural endowment.}, 
location = {}, 
keywords = {}}


@incollection{siegel2015,
author = {Siegel, Susanna and Silins, Nicholas}, 
title = {The Epistemology of Perception}, 
booktitle = {Oxford Handbook of Philosophy of Perception}, 
editor = {Matthen, Mohan}, 
publisher = {Oxford University Press}, 
address = {}, 
pages = {1-48}, 
year = {2015}, 
abstract = {An overview of the epistemology of perception, covering the nature of justification, immediate justification, the relationship between the metaphysics of perceptual experience and its rational role, the rational role of attention, and cognitive penetrability. The published version will contain a smaller bibliography, due to space constraints in the volume.}, 
keywords = {epistemology; perception}}

@article{crivellato2007,
author = {Crivellato, Enrico and Ribatti, Domenico}, 
title = {Soul, mind, brain: Greek philosophy and the birth of neuroscience}, 
journal = {Brain Research Bulletin}, 
volume = {71}, 
number = {4}, 
pages = {327--336}, 
year = {2007}, 
doi = {10.1016/j.brainresbull.2006.09.020}, 
abstract = {}, 
location = {}, 
keywords = {}}


@article{barrett2015,
author = {Barrett, LF and Simmons, WK}, 
title = {Interoceptive predictions in the brain.}, 
journal = {Nature Reviews Neuroscience}, 
volume = {16}, 
number = {7}, 
pages = {419--429}, 
year = {2015}, 
doi = {10.1038/nrn3950}, 
abstract = {Intuition suggests that perception follows sensation and therefore bodily feelings originate in the body. However, recent evidence goes against this logic: interoceptive experience may largely reflect limbic predictions about the expected state of the body that are constrained by ascending visceral sensations. In this Opinion article, we introduce the Embodied Predictive Interoception Coding model, which integrates an anatomical model of corticocortical connections with Bayesian active inference principles, to propose that agranular visceromotor cortices contribute to interoception by issuing interoceptive predictions. We then discuss how disruptions in interoceptive predictions could function as a common vulnerability for mental and physical illness.}, 
location = {}, 
keywords = {review; predictive coding}}


@incollection{simmons2013,
author = {Simmons, Alison}, 
title = {Perception in Early Modern Philosophy}, 
booktitle = {The Oxford Handbook of Philosophy of Perception}, 
editor = {Matthen, Mohan}, 
publisher = {Oxford University Press}, 
address = {Oxford}, 
pages = {}, 
year = {2013}, 
abstract = {The senses were subject to considerable scrutiny during the 17 th and 18 th centuries (traditionally called the "early modern" period). No early modern philosopher would have denied that the senses are an important source of knowledge about the world, but many worried that they are a systematically misleading source. Consider Malebranche's ominous warning:

I shall teach you that the world you live in is not at all as you believe it to be,

because actually it is not as you see it or sense it. You judge on the basis of

the relation of your senses to all the objects surrounding you, and your senses

beguile you infinitely more than you can imagine...there is no precision, no

truth in their testimony. 1

Descartes before him was less melodramatic but similarly critical: the senses "do not, except occasionally and accidentally, show us what external bodies are like in themselves." 2 It's not all bad news for the senses, however. Hand in hand with this worry about their ability to show us what the world is really like came an extensive re-examination of almost all aspects of perception. Along the way, the early moderns made important advances in our understanding of the perceptual process, established some of the classic questions with which philosophers and perceptual psychologists wrestled for centuries, and even offered a new vision of the proper function of the senses.}, 
keywords = {history of science; history of perception}}


<!-- end_file: "refs/workflow.bib" -->


## Songs {#sec-songs .unnumbered}

---
bibliography_songs: "refs/songs.yml"
---

::: {#refs_songs }
:::

<!-- begin_file: "refs/songs.yml" -->
references:
- id: MorphineCFP
  author:
    - literal: Morphine
    - family: Sandman
      given: Mark
    - family: Colley
      given: Dana
    - family: Deupree
      given: Jerome
  call-number: '9'
  collection-title: Cure For Pain
  dimensions: '3:14'
  issued:
    - year: 1993
  language: ENG
  medium: CD
  publisher: Rykodisc
  title: Cure For Pain
  type: song
  URL: https://open.spotify.com/track/3hO9gaVixKDoYDrlTBrEWf?si=0668baf1aab345d4

<!-- end_file: "refs/songs.yml" -->


## Paintings {#sec-paintings .unnumbered}

---
bibliography_paintings: "refs/paintings.yml"
---

::: {#refs_paintings }
:::

<!-- begin_file: "refs/paintings.yml" -->
references:
- id: Draper1909
  abstract: >-
    Draper, Herbert James. Ulysses and the Sirens. Painting, oil on canvas
    (177cm x 213,5cm). Ferens Art Gallery (FER96235). Wikidata: Q5444068.
  author:
    - family: Draper
      given: Herbert James
  citation-key: Draper1909
  dimensions: Pintura
  issued:
    - year: 1909
  title: Ulysses and the Sirens
  type: graphic


<!-- end_file: "refs/paintings.yml" -->


<!-- begin_file: "_quarto.yml" -->website:
  author: Bernardo César Diniz Athayde Vasconcelos
  title: ScrivQ 24
  description: A Scrivener template project for Quarto capable of exporting multiple files, handling cross-references, and keeping a bibliography.
  reader-mode: true
  search: 
    location: navbar
    type: overlay
  page-navigation: true
  back-to-top-navigation: true

title: "Hello, ScrivQ!"
license: CC BY-NC-SA
copyright:
  holder: Bernardo C. D. A. Vasconcelos
  year: 2024
project:
  preview:
    port: 5556
    watch-inputs: true
    navigate: true


filters:
  - citetools


execute:
  output: asis
  cache: true
  freeze: auto


format:


  html:

    template: _extensions/templates/html/template.html # template.html

    template-partials:
      - _extensions/templates/html/html.template # html.template
      - _extensions/templates/html/title-block.html # title-block.html
      - _extensions/templates/html/template.html # template.html
      - _extensions/templates/html/styles.html # styles.html
      - _extensions/templates/html/html.styles # html.styles
      - _extensions/templates/html/toc.html # toc.html
      - _extensions/templates/html/metadata.html # metadata.html

    theme: # default cerulean cosmo cyborg darkly flatly journal litera lumen lux materia minty morph pulse quartz sandstone simplex sketchy slate solar spacelab superhero united vapor yeti zephyr
      light: [Pulse] 
      dark: [Cyborg]

    embed-resources: true
    self-contained-math: true
    anchor-sections: true
    smooth-scroll: true
    code-links:
      - text: Compile Script
        icon: file-code
        href: compile.rb
      - text: Source File
        icon: file-code
        href: <$inputfile>

# Toc
    toc: true
    toc-depth: 3
    toc-expand: 2
    toc-location: left
    toc-title: Contents
    number-sections: true
    number-depth: 3

# Code
    code-link: true
    code-copy: true
    code-tools: true
    code-fold: show
    highlight-style: github
    code-line-numbers: true
    code-overflow: wrap

# Fonts
    linestretch: 1.5
    fontsize: 12pt
    fontfamily: Alegreya
    mainfont: Alegreya
    sansfont: Alegreya Sans
    monofont: Source Code Pro

# Layout
    cap-location: bottom
    fig-cap-location: bottom
    tbl-cap-location: bottom
    reference-location: margin
    appendix-style: default
    link-fields: true

    include-before: |
      <style>
      @import url('https://fonts.googleapis.com/css2?family=Alegreya+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Alegreya:ital,wght@0,400;0,700;1,400;1,700&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Source+Code+Pro:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,200;1,300;1,400;1,500;1,600;1,700;1,800&family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&family=Source+Serif+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&display=swap');
      </style>


  pdf:
    link-fields: true
    pdf-engine: lualatex
    documentclass: scrbook
    classoption:
      - oneside
      - cleardoublepage=empty
      - numbers=noenddot
      - titlepage
      - toclink=all
      - toc=bibliography
      - headinclude
      - footinclude
    indent: true
    cap-location: bottom
    fig-cap-location: bottom
    tbl-cap-location: bottom
    pagestyle: headings
    hyperrefoptions:
      - pdfstartview=FitR
      - pdfpagemode=UseOutlines
      - breaklinks=true
      - pageanchor=true
      - linktoc=all
      - hyperfootnotes=false
      - bookmarksnumbered
    header-includes: |
      \usepackage{setspace}
      \usepackage{etoolbox}
      \usepackage{metalogo}
      \newfontfamily{\sanskritfont}{Noto Serif Devanagari} 
      \newcommand{\skt}[1]{\foreignlanguage{sanskrit}{\selectfont\sanskritfont #1}}
      \newenvironment{sanskrit}{\begingroup
      \selectlanguage{sanskrit}\selectfont\sanskritfont\normalsize}{\endgroup}
      \usepackage{xcolor}
      \definecolor{CTlink}{named}{RoyalBlue} % RoyalBlue {cmyk}{1, 0.50, 0, 0}
      \definecolor{halfgray}{gray}{0.55} % chapt numbers semi transp .5 .55 .6 .0
      \setsansfont{AlegreyaSans-Regular}[Extension = .otf , BoldFont = AlegreyaSans-Bold , ItalicFont = AlegreyaSans-Italic , BoldItalicFont = AlegreyaSans-BoldItalic ]
    standalone: true
    latex-auto-install: true
    latex-auto-mk: true
    latex-tinytex: true
    keep-tex: true
    babel-lang: english
    babel-otherlangs:
      - brazilian
      - ancientgreek
      - sanskrit
    toc: true
    toc-depth: 3
    toc-title: Summary
    lof: true
    lot: true
    number-sections: true
    number-depth: 3
    top-level-division: chapter
    linestretch: 1.3
    fontsize: 10pt
    fontfamily: Alegreya
    mainfont: Gentium Plus
    mainfontoptions:
      - Numbers=Proportional
      - Numbers=Lowercase
    sansfont: Alegreya Sans
    monofont: Ubuntu Mono
    colorlinks: true
    citecolor: RoyalBlue
    filecolor: RoyalBlue
    linkcolor: RoyalBlue
    toccolor: RoyalBlue
    urlcolor: RoyalBlue
    highlight-style: github
    code-line-numbers: true
    code-overflow: wrap
    ascii: false
    appendix-style: default
    float: true
    csquotes: true
    biblio-title: Bibliography


  typst-citations:
    link-fields: false # if true, compilation fails
    title: Hello, ScrivQ
    author: Bernardo Vasconcelos
    date: 2024-11
    abstract: The Abstract
    toc: false
    number-sections: true
    number-depth: 3
    fontsize: 12pt
    mainfont: Gentium Plus
    sansfont: Alegreya Sans
    monofont: Source Code Pro
    tbl-cap-location: bottom
    keep-typ: true
    prefer-html: true
    papersize: a4 
    template: _extensions/templates/typst/orange/template.typ # template
    template-partials:
        - _extensions/templates/typst/definitions.typ # definitions
        - _extensions/templates/typst/orange/typst-template.typ # typst-template
        - _extensions/templates/typst/typst-show.typ # typst-show
        - _extensions/templates/typst/notes.typ # notes
        - _extensions/templates/typst/biblio.typ # biblio


  docx:
    subject: Hello, ScrivQ
    keywords: [ScrivQ, Scrivener, Quarto, Pandoc]
    toc: true
    toc-depth: 3
    toc-title: Summary
    number-sections: true
    number-depth: 3
    sidebar-width: 300px
    body-width: 900px
    margin-width: 300px
    gutter-width: 1.5rem
    embed-resources: false
    self-contained-math: false
    standalone: true
    highlight-style: github


validate-yaml: false
prefer-html: true
citation: true
cite-method: citeproc
citeproc: false # CiteTools will call Citeproc

csl: _extensions/csl/abnt-phi.csl # ABNT-Phi.csl
verbose: false
verbosity: ERROR
notes-after-punctuation: true

link-citations: true
link-bibliography: true

bibliography_primary-sources: "refs/primary-sources.yml" # primary sources
bibliography_secondary-sources: "refs/secondary-sources.yml" # secondary sources
bibliography_workflow: "refs/workflow.bib" # Workflow
bibliography_songs: "refs/songs.yml" # Songs
bibliography_paintings: "refs/paintings.yml" # Paintings

<!-- end_file: "_quarto.yml" -->


<!-- begin_file: "_extensions/templates/html/template.html" --><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="$lang$" xml:lang="$lang$"$if(dir)$ dir="$dir$"$endif$>

<head>

$metadata.html()$

<style>
$styles.html()$
</style>

<!-- htmldependencies:E3FAD763 -->
$for(header-includes)$
$header-includes$
$endfor$

$if(math)$
$if(mathjax)$
  <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
$endif$
  $math$
$endif$

$for(css)$
<link rel="stylesheet" href="$css$" />
$endfor$
</head>

<body>

$for(include-before)$
$include-before$
$endfor$

$if(title)$
$title-block.html()$
$elseif(subtitle)$
$title-block.html()$
$elseif(by-author)$
$title-block.html()$
$endif$

$if(toc)$
$toc.html()$
$endif$

$body$

$for(include-after)$
$include-after$
$endfor$

</body>

</html>

<!-- end_file: "_extensions/templates/html/template.html" -->


<!-- begin_file: "_extensions/templates/html/title-block.html" --><header id="title-block-header">
$if(title)$<h1 class="title">$title$</h1>$endif$
$if(subtitle)$
<p class="subtitle">$subtitle$</p>
$endif$
$for(author)$
<p class="author">$author$</p>
$endfor$

$if(date)$
<p class="date">$date$</p>
$endif$
$if(abstract)$
<div class="abstract">
<div class="abstract-title">$abstract-title$</div>
$abstract$
</div>
$endif$
</header>

<!-- end_file: "_extensions/templates/html/title-block.html" -->


<!-- begin_file: "_extensions/templates/html/styles.html" -->$if(document-css)$
html {
$if(mainfont)$
  font-family: $mainfont$;
$endif$
$if(fontsize)$
  font-size: $fontsize$;
$endif$
$if(linestretch)$
  line-height: $linestretch$;
$endif$
  color: $if(fontcolor)$$fontcolor$$else$#1a1a1a$endif$;
  background-color: $if(backgroundcolor)$$backgroundcolor$$else$#fdfdfd$endif$;
}
body {
  margin: 0 auto;
  max-width: $if(maxwidth)$$maxwidth$$else$36em$endif$;
  padding-left: $if(margin-left)$$margin-left$$else$50px$endif$;
  padding-right: $if(margin-right)$$margin-right$$else$50px$endif$;
  padding-top: $if(margin-top)$$margin-top$$else$50px$endif$;
  padding-bottom: $if(margin-bottom)$$margin-bottom$$else$50px$endif$;
  hyphens: auto;
  overflow-wrap: break-word;
  text-rendering: optimizeLegibility;
  font-kerning: normal;
}
@media (max-width: 600px) {
  body {
    font-size: 0.9em;
    padding: 12px;
  }
  h1 {
    font-size: 1.8em;
  }
}
@media print {
  html {
    background-color: $if(backgroundcolor)$$backgroundcolor$$else$white$endif$;
  }
  body {
    background-color: transparent;
    color: black;
    font-size: 12pt;
  }
  p, h2, h3 {
    orphans: 3;
    widows: 3;
  }
  h2, h3, h4 {
    page-break-after: avoid;
  }
}
p {
  margin: 1em 0;
}
a {
  color: $if(linkcolor)$$linkcolor$$else$#1a1a1a$endif$;
}
a:visited {
  color: $if(linkcolor)$$linkcolor$$else$#1a1a1a$endif$;
}
img {
  max-width: 100%;
}
svg {
  height; auto;
  max-width: 100%;
}
h1, h2, h3, h4, h5, h6 {
  margin-top: 1.4em;
}
h5, h6 {
  font-size: 1em;
  font-style: italic;
}
h6 {
  font-weight: normal;
}
ol, ul {
  padding-left: 1.7em;
  margin-top: 1em;
}
li > ol, li > ul {
  margin-top: 0;
}
ul > li:not(:has(> p)) > ul,
ol > li:not(:has(> p)) > ul,
ul > li:not(:has(> p)) > ol,
ol > li:not(:has(> p)) > ol {
  margin-bottom: 0;
}
ul > li:not(:has(> p)) > ul > li:has(> p),
ol > li:not(:has(> p)) > ul > li:has(> p),
ul > li:not(:has(> p)) > ol > li:has(> p),
ol > li:not(:has(> p)) > ol > li:has(> p) {
  margin-top: 1rem;
}
blockquote {
  margin: 1em 0 1em 1.7em;
  padding-left: 1em;
  border-left: 2px solid #e6e6e6;
  color: #606060;
}
$if(abstract)$
div.abstract {
  margin: 2em 2em 2em 2em;
  text-align: left;
  font-size: 85%;
}
div.abstract-title {
  font-weight: bold;
  text-align: center;
  padding: 0;
  margin-bottom: 0.5em;
}
$endif$
code {
  font-family: $if(monofont)$$monofont$$else$Menlo, Monaco, Consolas, 'Lucida Console', monospace$endif$;
$if(monobackgroundcolor)$
  background-color: $monobackgroundcolor$;
  padding: .2em .4em;
$endif$
  font-size: 85%;
  margin: 0;
  hyphens: manual;
}
pre {
  margin: 1em 0;
$if(monobackgroundcolor)$
  background-color: $monobackgroundcolor$;
  padding: 1em;
$endif$
  overflow: auto;
}
pre code {
  padding: 0;
  overflow: visible;
  overflow-wrap: normal;
}
.sourceCode {
 background-color: transparent;
 overflow: visible;
}
hr {
  background-color: #1a1a1a;
  border: none;
  height: 1px;
  margin: 1em 0;
}
table {
  margin: 1em 0;
  border-collapse: collapse;
  width: 100%;
  overflow-x: auto;
  display: block;
  font-variant-numeric: lining-nums tabular-nums;
}
table caption {
  margin-bottom: 0.75em;
}
tbody {
  margin-top: 0.5em;
  border-top: 1px solid $if(fontcolor)$$fontcolor$$else$#1a1a1a$endif$;
  border-bottom: 1px solid $if(fontcolor)$$fontcolor$$else$#1a1a1a$endif$;
}
th {
  border-top: 1px solid $if(fontcolor)$$fontcolor$$else$#1a1a1a$endif$;
  padding: 0.25em 0.5em 0.25em 0.5em;
}
td {
  padding: 0.125em 0.5em 0.25em 0.5em;
}
header {
  margin-bottom: 4em;
  text-align: center;
}
#TOC li {
  list-style: none;
}
#TOC ul {
  padding-left: 1.3em;
}
#TOC > ul {
  padding-left: 0;
}
#TOC a:not(:hover) {
  text-decoration: none;
}
$endif$
code{white-space: pre-wrap;}
span.smallcaps{font-variant: small-caps;}
div.columns{display: flex; gap: min(4vw, 1.5em);}
div.column{flex: auto; overflow-x: auto;}
div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
ul.task-list{list-style: none;}
ul.task-list li input[type="checkbox"] {
  width: 0.8em;
  margin: 0 0.8em 0.2em -1em; /* quarto-specific, see https://github.com/quarto-dev/quarto-cli/issues/4556 */ 
  vertical-align: middle;
}
$if(quotes)$
q { quotes: """ """ "'" "'"; }
$endif$
$if(displaymath-css)$
.display.math{display: block; text-align: center; margin: 0.5rem auto;}
$endif$
$if(highlighting-css)$
/* CSS for syntax highlighting */
$highlighting-css$
$endif$
$if(csl-css)$
$styles.citations.html()$
$endif$
<!-- end_file: "_extensions/templates/html/styles.html" -->


<!-- begin_file: "_extensions/templates/html/html.template" --><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="$lang$" xml:lang="$lang$"$if(dir)$ dir="$dir$"$endif$>
<head>
  <meta charset="utf-8" />
  <meta name="generator" content="pandoc" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
$for(author-meta)$
  <meta name="author" content="$author-meta$" />
$endfor$
$if(date-meta)$
  <meta name="dcterms.date" content="$date-meta$" />
$endif$
$if(keywords)$
  <meta name="keywords" content="$for(keywords)$$keywords$$sep$, $endfor$" />
$endif$
$if(description-meta)$
  <meta name="description" content="$description-meta$" />
$endif$
  <title>$if(title-prefix)$$title-prefix$ -- $endif$$pagetitle$</title>
  <style>
    $styles.html()$
  </style>
$for(css)$
  <link rel="stylesheet" href="$css$" />
$endfor$
$for(header-includes)$
  $header-includes$
$endfor$
$if(math)$
  $math$
$endif$
</head>
<body>
$for(include-before)$
$include-before$
$endfor$
$if(title)$
<header id="title-block-header">
<h1 class="title">$title$</h1>
$if(subtitle)$
<p class="subtitle">$subtitle$</p>
$endif$
$for(author)$
<p class="author">$author$</p>
$endfor$
$if(date)$
<p class="date">$date$</p>
$endif$
$if(abstract)$
<div class="abstract">
<div class="abstract-title">$abstract-title$</div>
$abstract$
</div>
$endif$
</header>
$endif$
$if(toc)$
<nav id="$idprefix$TOC" role="doc-toc">
$if(toc-title)$
<h2 id="$idprefix$toc-title">$toc-title$</h2>
$endif$
$table-of-contents$
</nav>
$endif$
$body$
$for(include-after)$
$include-after$
$endfor$
</body>
</html>

<!-- end_file: "_extensions/templates/html/html.template" -->


<!-- begin_file: "_extensions/templates/html/html.styles" -->$if(document-css)$
html {
$if(mainfont)$
  font-family: $mainfont$;
$endif$
$if(fontsize)$
  font-size: $fontsize$;
$endif$
$if(linestretch)$
  line-height: $linestretch$;
$endif$
  color: $if(fontcolor)$$fontcolor$$else$#1a1a1a$endif$;
  background-color: $if(backgroundcolor)$$backgroundcolor$$else$#fdfdfd$endif$;
}
body {
  margin: 0 auto;
  max-width: $if(maxwidth)$$maxwidth$$else$36em$endif$;
  padding-left: $if(margin-left)$$margin-left$$else$50px$endif$;
  padding-right: $if(margin-right)$$margin-right$$else$50px$endif$;
  padding-top: $if(margin-top)$$margin-top$$else$50px$endif$;
  padding-bottom: $if(margin-bottom)$$margin-bottom$$else$50px$endif$;
  hyphens: auto;
  overflow-wrap: break-word;
  text-rendering: optimizeLegibility;
  font-kerning: normal;
}
@media (max-width: 600px) {
  body {
    font-size: 0.9em;
    padding: 12px;
  }
  h1 {
    font-size: 1.8em;
  }
}
@media print {
  html {
    background-color: $if(backgroundcolor)$$backgroundcolor$$else$white$endif$;
  }
  body {
    background-color: transparent;
    color: black;
    font-size: 12pt;
  }
  p, h2, h3 {
    orphans: 3;
    widows: 3;
  }
  h2, h3, h4 {
    page-break-after: avoid;
  }
}
p {
  margin: 1em 0;
}
a {
  color: $if(linkcolor)$$linkcolor$$else$#1a1a1a$endif$;
}
a:visited {
  color: $if(linkcolor)$$linkcolor$$else$#1a1a1a$endif$;
}
img {
  max-width: 100%;
}
svg {
  height: auto;
  max-width: 100%;
}
h1, h2, h3, h4, h5, h6 {
  margin-top: 1.4em;
}
h5, h6 {
  font-size: 1em;
  font-style: italic;
}
h6 {
  font-weight: normal;
}
ol, ul {
  padding-left: 1.7em;
  margin-top: 1em;
}
li > ol, li > ul {
  margin-top: 0;
}
blockquote {
  margin: 1em 0 1em 1.7em;
  padding-left: 1em;
  border-left: 2px solid #e6e6e6;
  color: #606060;
}
$if(abstract)$
div.abstract {
  margin: 2em 2em 2em 2em;
  text-align: left;
  font-size: 85%;
}
div.abstract-title {
  font-weight: bold;
  text-align: center;
  padding: 0;
  margin-bottom: 0.5em;
}
$endif$
code {
  font-family: $if(monofont)$$monofont$$else$Menlo, Monaco, Consolas, 'Lucida Console', monospace$endif$;
$if(monobackgroundcolor)$
  background-color: $monobackgroundcolor$;
  padding: .2em .4em;
$endif$
  font-size: 85%;
  margin: 0;
  hyphens: manual;
}
pre {
  margin: 1em 0;
$if(monobackgroundcolor)$
  background-color: $monobackgroundcolor$;
  padding: 1em;
$endif$
  overflow: auto;
}
pre code {
  padding: 0;
  overflow: visible;
  overflow-wrap: normal;
}
.sourceCode {
 background-color: transparent;
 overflow: visible;
}
hr {
  background-color: #1a1a1a;
  border: none;
  height: 1px;
  margin: 1em 0;
}
table {
  margin: 1em 0;
  border-collapse: collapse;
  width: 100%;
  overflow-x: auto;
  display: block;
  font-variant-numeric: lining-nums tabular-nums;
}
table caption {
$if(table-caption-below)$
  caption-side: bottom;
  margin-top: 0.75em;
$else$
  margin-bottom: 0.75em;
$endif$
}
tbody {
  margin-top: 0.5em;
  border-top: 1px solid $if(fontcolor)$$fontcolor$$else$#1a1a1a$endif$;
  border-bottom: 1px solid $if(fontcolor)$$fontcolor$$else$#1a1a1a$endif$;
}
th {
  border-top: 1px solid $if(fontcolor)$$fontcolor$$else$#1a1a1a$endif$;
  padding: 0.25em 0.5em 0.25em 0.5em;
}
td {
  padding: 0.125em 0.5em 0.25em 0.5em;
}
header {
  margin-bottom: 4em;
  text-align: center;
}
#TOC li {
  list-style: none;
}
#TOC ul {
  padding-left: 1.3em;
}
#TOC > ul {
  padding-left: 0;
}
#TOC a:not(:hover) {
  text-decoration: none;
}
$endif$
code{white-space: pre-wrap;}
span.smallcaps{font-variant: small-caps;}
div.columns{display: flex; gap: min(4vw, 1.5em);}
div.column{flex: auto; overflow-x: auto;}
div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
/* The extra [class] is a hack that increases specificity enough to
   override a similar rule in reveal.js */
ul.task-list[class]{list-style: none;}
ul.task-list li input[type="checkbox"] {
  font-size: inherit;
  width: 0.8em;
  margin: 0 0.8em 0.2em -1.6em;
  vertical-align: middle;
}
$if(quotes)$
q { quotes: """ """ "'" "'"; }
$endif$
$if(displaymath-css)$
.display.math{display: block; text-align: center; margin: 0.5rem auto;}
$endif$
$if(highlighting-css)$
/* CSS for syntax highlighting */
$highlighting-css$
$endif$
$if(csl-css)$
$styles.citations.html()$
$endif$
<!-- end_file: "_extensions/templates/html/html.styles" -->


<!-- begin_file: "_extensions/templates/html/toc.html" --><nav id="$idprefix$TOC" role="doc-toc">
  $if(toc-title)$
  <h2 id="$idprefix$toc-title">$toc-title$</h2>
  $endif$ 
  $table-of-contents$
</nav>

<!-- end_file: "_extensions/templates/html/toc.html" -->


<!-- begin_file: "_extensions/templates/html/metadata.html" --><meta charset="utf-8" />
$if(quarto-version)$
<meta name="generator" content="quarto-$quarto-version$" />
$else$
<meta name="generator" content="quarto" />
$endif$

<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />

$for(author-meta)$
<meta name="author" content="$author-meta$" />
$endfor$
$if(date-meta)$
<meta name="dcterms.date" content="$date-meta$" />
$endif$
$if(keywords)$
<meta name="keywords" content="$for(keywords)$$keywords$$sep$, $endfor$" />
$endif$
$if(description-meta)$
<meta name="description" content="$description-meta$" />
$endif$

<title>$pagetitle$$if(title-prefix)$ -- $title-prefix$$endif$</title>

<!-- end_file: "_extensions/templates/html/metadata.html" -->


<!-- begin_file: "_extensions/templates/tex/template.tex" -->% Options for packages loaded elsewhere
\PassOptionsToPackage{unicode$for(hyperrefoptions)$,$hyperrefoptions$$endfor$}{hyperref}
\PassOptionsToPackage{hyphens}{url}
$if(colorlinks)$
\PassOptionsToPackage{dvipsnames,svgnames,x11names}{xcolor}
$endif$
$if(CJKmainfont)$
\PassOptionsToPackage{space}{xeCJK}
$endif$
%
$doc-class.tex()$

$if(beamer)$
$if(background-image)$
\usebackgroundtemplate{%
  \includegraphics[width=\paperwidth]{$background-image$}%
}
% In beamer background-image does not work well when other images are used, so this is the workaround
\pgfdeclareimage[width=\paperwidth,height=\paperheight]{background}{$background-image$}
\usebackgroundtemplate{\pgfuseimage{background}}
$endif$
\usepackage{pgfpages}
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{caption label separator}{: }
\setbeamercolor{caption name}{fg=normal text.fg}
\beamertemplatenavigationsymbols$if(navigation)$$navigation$$else$empty$endif$
$for(beameroption)$
\setbeameroption{$beameroption$}
$endfor$
% Prevent slide breaks in the middle of a paragraph
\widowpenalties 1 10000
\raggedbottom
$if(section-titles)$
\setbeamertemplate{part page}{
  \centering
  \begin{beamercolorbox}[sep=16pt,center]{part title}
    \usebeamerfont{part title}\insertpart\par
  \end{beamercolorbox}
}
\setbeamertemplate{section page}{
  \centering
  \begin{beamercolorbox}[sep=12pt,center]{part title}
    \usebeamerfont{section title}\insertsection\par
  \end{beamercolorbox}
}
\setbeamertemplate{subsection page}{
  \centering
  \begin{beamercolorbox}[sep=8pt,center]{part title}
    \usebeamerfont{subsection title}\insertsubsection\par
  \end{beamercolorbox}
}
\AtBeginPart{
  \frame{\partpage}
}
\AtBeginSection{
  \ifbibliography
  \else
    \frame{\sectionpage}
  \fi
}
\AtBeginSubsection{
  \frame{\subsectionpage}
}
$endif$
$endif$
$if(beamerarticle)$
\usepackage{beamerarticle} % needs to be loaded first
$endif$

\usepackage{amsmath,amssymb}
$if(linestretch)$
\usepackage{setspace}
$endif$
\usepackage{iftex}
\ifPDFTeX
  \usepackage[$if(fontenc)$$fontenc$$else$T1$endif$]{fontenc}
  \usepackage[utf8]{inputenc}
  \usepackage{textcomp} % provide euro and other symbols
\else % if luatex or xetex
$if(mathspec)$
  \ifXeTeX
    \usepackage{mathspec} % this also loads fontspec
  \else
    \usepackage{unicode-math} % this also loads fontspec
  \fi
$else$
  \usepackage{unicode-math}
$endif$
  \defaultfontfeatures{Scale=MatchLowercase}$-- must come before Beamer theme
  \defaultfontfeatures[\rmfamily]{Ligatures=TeX,Scale=1}
\fi
$if(fontfamily)$
$else$
$-- Set default font before Beamer theme so the theme can override it
\usepackage{lmodern}
$endif$
$-- Set Beamer theme before user font settings so they can override theme
$if(beamer)$
$if(theme)$
\usetheme[$for(themeoptions)$$themeoptions$$sep$,$endfor$]{$theme$}
$endif$
$if(colortheme)$
\usecolortheme{$colortheme$}
$endif$
$if(fonttheme)$
\usefonttheme{$fonttheme$}
$endif$
$if(mainfont)$
\usefonttheme{serif} % use mainfont rather than sansfont for slide text
$endif$
$if(innertheme)$
\useinnertheme{$innertheme$}
$endif$
$if(outertheme)$
\useoutertheme{$outertheme$}
$endif$
$endif$
$-- User font settings (must come after default font and Beamer theme)
$if(fontfamily)$
\usepackage[$for(fontfamilyoptions)$$fontfamilyoptions$$sep$,$endfor$]{$fontfamily$}
$endif$
\ifPDFTeX\else  
    % xetex/luatex font selection
$if(mainfont)$
  \setmainfont[$for(mainfontoptions)$$mainfontoptions$$sep$,$endfor$]{$mainfont$}
$endif$
$if(sansfont)$
  \setsansfont[$for(sansfontoptions)$$sansfontoptions$$sep$,$endfor$]{$sansfont$}
$endif$
$if(monofont)$
  \setmonofont[$for(monofontoptions)$$monofontoptions$$sep$,$endfor$]{$monofont$}
$endif$
$for(fontfamilies)$
  \newfontfamily{$fontfamilies.name$}[$for(fontfamilies.options)$$fontfamilies.options$$sep$,$endfor$]{$fontfamilies.font$}
$endfor$
$if(mathfont)$
$if(mathspec)$
  \ifXeTeX
    \setmathfont(Digits,Latin,Greek)[$for(mathfontoptions)$$mathfontoptions$$sep$,$endfor$]{$mathfont$}
  \else
    \setmathfont[$for(mathfontoptions)$$mathfontoptions$$sep$,$endfor$]{$mathfont$}
  \fi
$else$
  \setmathfont[$for(mathfontoptions)$$mathfontoptions$$sep$,$endfor$]{$mathfont$}
$endif$
$endif$
$if(CJKmainfont)$
  \ifXeTeX
    \usepackage{xeCJK}
    \setCJKmainfont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKmainfont$}
    $if(CJKsansfont)$
      \setCJKsansfont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKsansfont$}
    $endif$
    $if(CJKmonofont)$
      \setCJKmonofont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKmonofont$}
    $endif$
  \fi
$endif$
$if(luatexjapresetoptions)$
  \ifLuaTeX
    \usepackage[$for(luatexjapresetoptions)$$luatexjapresetoptions$$sep$,$endfor$]{luatexja-preset}
  \fi
$endif$
$if(CJKmainfont)$
  \ifLuaTeX
    \usepackage[$for(luatexjafontspecoptions)$$luatexjafontspecoptions$$sep$,$endfor$]{luatexja-fontspec}
    \setmainjfont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKmainfont$}
  \fi
$endif$
\fi
$if(zero-width-non-joiner)$
%% Support for zero-width non-joiner characters.
\makeatletter
\def\zerowidthnonjoiner{%
  % Prevent ligatures and adjust kerning, but still support hyphenating.
  \texorpdfstring{%
    \TextOrMath{\nobreak\discretionary{-}{}{\kern.03em}%
      \ifvmode\else\nobreak\hskip\z@skip\fi}{}%
  }{}%
}
\makeatother
\ifPDFTeX
  \DeclareUnicodeCharacter{200C}{\zerowidthnonjoiner}
\else
  \catcode`^^^^200c=\active
  \protected\def ^^^^200c{\zerowidthnonjoiner}
\fi
%% End of ZWNJ support
$endif$
% Use upquote if available, for straight quotes in verbatim environments
\IfFileExists{upquote.sty}{\usepackage{upquote}}{}
\IfFileExists{microtype.sty}{% use microtype if available
  \usepackage[$for(microtypeoptions)$$microtypeoptions$$sep$,$endfor$]{microtype}
  \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
}{}
$if(indent)$
$else$
\makeatletter
\@ifundefined{KOMAClassName}{% if non-KOMA class
  \IfFileExists{parskip.sty}{%
    \usepackage{parskip}
  }{% else
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{6pt plus 2pt minus 1pt}}
}{% if KOMA class
  \KOMAoptions{parskip=half}}
\makeatother
$endif$
$if(verbatim-in-note)$
\usepackage{fancyvrb}
$endif$
\usepackage{xcolor}
$if(geometry)$
$if(beamer)$
\geometry{$for(geometry)$$geometry$$sep$,$endfor$}
$else$
\usepackage[$for(geometry)$$geometry$$sep$,$endfor$]{geometry}
$endif$
$endif$
$if(beamer)$
\newif\ifbibliography
$endif$
$if(listings)$
\usepackage{listings}
\newcommand{\passthrough}[1]{#1}
\lstset{defaultdialect=[5.3]Lua}
\lstset{defaultdialect=[x86masm]Assembler}
$endif$
$if(lhs)$
\lstnewenvironment{code}{\lstset{language=Haskell,basicstyle=\small\ttfamily}}{}
$endif$
$if(svg)$
\usepackage{svg}
$endif$
$if(strikeout)$
$-- also used for underline
\ifLuaTeX
  \usepackage{luacolor}
  \usepackage[soul]{lua-ul}
\else
  \usepackage{soul}
\fi
$endif$
\setlength{\emergencystretch}{3em} % prevent overfull lines
$if(numbersections)$
\setcounter{secnumdepth}{$if(secnumdepth)$$secnumdepth$$else$5$endif$}
$else$
\setcounter{secnumdepth}{-\maxdimen} % remove section numbering
$endif$
$if(beamer)$
$else$
$if(block-headings)$
% Make \paragraph and \subparagraph free-standing
\ifx\paragraph\undefined\else
  \let\oldparagraph\paragraph
  \renewcommand{\paragraph}[1]{\oldparagraph{#1}\mbox{}}
\fi
\ifx\subparagraph\undefined\else
  \let\oldsubparagraph\subparagraph
  \renewcommand{\subparagraph}[1]{\oldsubparagraph{#1}\mbox{}}
\fi
$endif$
$endif$
$if(pagestyle)$
\pagestyle{$pagestyle$}
$endif$
$pandoc.tex()$
$if(lang)$
\ifLuaTeX
\usepackage[bidi=basic]{babel}
\else
\usepackage[bidi=default]{babel}
\fi
$if(babel-lang)$
\babelprovide[main,import]{$babel-lang$}
$if(mainfont)$
\ifPDFTeX
\else
\babelfont[$babel-lang$]{rm}[$for(mainfontoptions)$$mainfontoptions$$sep$,$endfor$]{$mainfont$}
\fi
$endif$
$endif$
$for(babel-otherlangs)$
\babelprovide[import]{$babel-otherlangs$}
$endfor$
$for(babelfonts/pairs)$
\babelfont[$babelfonts.key$]{rm}{$babelfonts.value$}
$endfor$
% get rid of language-specific shorthands (see #6817):
\let\LanguageShortHands\languageshorthands
\def\languageshorthands#1{}
$endif$
\ifLuaTeX
  \usepackage{selnolig}  % disable illegal ligatures
\fi
$if(dir)$
\ifPDFTeX
  \TeXXeTstate=1
  \newcommand{\RL}[1]{\beginR #1\endR}
  \newcommand{\LR}[1]{\beginL #1\endL}
  \newenvironment{RTL}{\beginR}{\endR}
  \newenvironment{LTR}{\beginL}{\endL}
\fi
$endif$
$if(biblio-config)$
$if(natbib)$
\usepackage[$natbiboptions$]{natbib}
\bibliographystyle{$if(biblio-style)$$biblio-style$$else$plainnat$endif$}
$endif$
$if(biblatex)$
\usepackage[$if(biblio-style)$style=$biblio-style$,$endif$$for(biblatexoptions)$$biblatexoptions$$sep$,$endfor$]{biblatex}
$for(bibliography)$
\addbibresource{$bibliography$}
$endfor$
$endif$
$endif$
$if(nocite-ids)$
\nocite{$for(nocite-ids)$$it$$sep$, $endfor$}
$endif$
$if(csquotes)$
\usepackage{csquotes}
$endif$
\IfFileExists{bookmark.sty}{\usepackage{bookmark}}{\usepackage{hyperref}}
\IfFileExists{xurl.sty}{\usepackage{xurl}}{} % add URL line breaks if available
\urlstyle{same} % disable monospaced font for URLs
$if(links-as-notes)$
% Make links footnotes instead of hotlinks:
\DeclareRobustCommand{\href}[2]{#2\footnote{\url{#1}}}
$endif$
$if(verbatim-in-note)$
\VerbatimFootnotes % allow verbatim text in footnotes
$endif$
\hypersetup{
$if(title-meta)$
  pdftitle={$title-meta$},
$endif$
$if(author-meta)$
  pdfauthor={$author-meta$},
$endif$
$if(lang)$
  pdflang={$lang$},
$endif$
$if(subject)$
  pdfsubject={$subject$},
$endif$
$if(keywords)$
  pdfkeywords={$for(keywords)$$keywords$$sep$, $endfor$},
$endif$
$if(colorlinks)$
  colorlinks=true,
  linkcolor={$if(linkcolor)$$linkcolor$$else$Maroon$endif$},
  filecolor={$if(filecolor)$$filecolor$$else$Maroon$endif$},
  citecolor={$if(citecolor)$$citecolor$$else$Blue$endif$},
  urlcolor={$if(urlcolor)$$urlcolor$$else$Blue$endif$},
$else$
$if(boxlinks)$
$else$
  hidelinks,
$endif$
$endif$
  pdfcreator={LaTeX via pandoc}}

$title.tex()$

\begin{document}
$before-body.tex()$
$for(include-before)$
$include-before$
$endfor$
$toc.tex()$
$if(linestretch)$
\setstretch{$linestretch$}
$endif$
$if(has-frontmatter)$
\mainmatter
$endif$
$body$

$before-bib.tex()$

$if(has-frontmatter)$
\backmatter
$endif$
$biblio.tex()$

$for(include-after)$
$include-after$

$endfor$
$after-body.tex()$
\end{document}

<!-- end_file: "_extensions/templates/tex/template.tex" -->


<!-- begin_file: "_extensions/templates/tex/doc-class.tex" -->\documentclass[
$if(fontsize)$
  $fontsize$,
$endif$
$if(papersize)$
  $papersize$paper,
$endif$
$if(beamer)$
  ignorenonframetext,
$if(handout)$
  handout,
$endif$
$if(aspectratio)$
  aspectratio=$aspectratio$,
$endif$
$endif$
$for(classoption)$
  $classoption$$sep$,
$endfor$
]{$documentclass$}

<!-- end_file: "_extensions/templates/tex/doc-class.tex" -->


<!-- begin_file: "_extensions/templates/tex/pandoc.tex" -->$if(highlighting-macros)$
$highlighting-macros$
$endif$

$tightlist.tex()$
$tables.tex()$
$graphics.tex()$
$citations.tex()$

$for(header-includes)$
$header-includes$
$endfor$

<!-- end_file: "_extensions/templates/tex/pandoc.tex" -->


<!-- begin_file: "_extensions/templates/tex/title.tex" -->$if(title)$
\title{$title$$if(thanks)$\thanks{$thanks$}$endif$}
$endif$
$if(subtitle)$
$if(beamer)$
$else$
\usepackage{etoolbox}
\makeatletter
\providecommand{\subtitle}[1]{% add subtitle to \maketitle
  \apptocmd{\@title}{\par {\large #1 \par}}{}{}
}
\makeatother
$endif$
\subtitle{$subtitle$}
$endif$
\author{$for(authors)$$it.name.literal$$sep$ \and $endfor$}
\date{$date$}
$if(beamer)$
$if(institute)$
\institute{$for(institute)$$institute$$sep$ \and $endfor$}
$endif$
$if(titlegraphic)$
\titlegraphic{\includegraphics{$titlegraphic$}}
$endif$
$if(logo)$
\logo{\includegraphics{$logo$}}
$endif$
$endif$

<!-- end_file: "_extensions/templates/tex/title.tex" -->


<!-- begin_file: "_extensions/templates/tex/toc.tex" -->$if(toc)$
$if(toc-title)$
\renewcommand*\contentsname{$toc-title$}
$endif$
$if(beamer)$
\begin{frame}[allowframebreaks]
$if(toc-title)$
  \frametitle{$toc-title$}
$endif$
  \tableofcontents[hideallsubsections]
\end{frame}
$else$
{
$if(colorlinks)$
\hypersetup{linkcolor=$if(toccolor)$$toccolor$$else$$endif$}
$endif$
\setcounter{tocdepth}{$toc-depth$}
\tableofcontents
}
$endif$
$endif$
$if(lof)$
\listoffigures
$endif$
$if(lot)$
\listoftables
$endif$

<!-- end_file: "_extensions/templates/tex/toc.tex" -->


<!-- begin_file: "_extensions/templates/tex/before-body.tex" -->$if(has-frontmatter)$
\frontmatter
$endif$
$if(title)$
$if(beamer)$
\frame{\titlepage}
$else$
\maketitle
$endif$
$if(abstract)$
\begin{abstract}
$abstract$
\end{abstract}
$endif$
$endif$

<!-- end_file: "_extensions/templates/tex/before-body.tex" -->


<!-- begin_file: "_extensions/templates/tex/before-bib.tex" -->
<!-- end_file: "_extensions/templates/tex/before-bib.tex" -->


<!-- begin_file: "_extensions/templates/tex/biblio.tex" -->$if(natbib)$
$if(bibliography)$
$if(biblio-title)$
$if(has-chapters)$
\renewcommand\bibname{$biblio-title$}
$else$
\renewcommand\refname{$biblio-title$}
$endif$
$endif$
$if(beamer)$
\begin{frame}[allowframebreaks]{$biblio-title$}
  \bibliographytrue
$endif$
  \bibliography{$for(bibliography)$$bibliography$$sep$,$endfor$}
$if(beamer)$
\end{frame}
$endif$

$endif$
$endif$
$if(biblatex)$
$if(beamer)$
\begin{frame}[allowframebreaks]{$biblio-title$}
  \bibliographytrue
  \printbibliography[heading=none]
\end{frame}
$else$
\printbibliography$if(biblio-title)$[title=$biblio-title$]$endif$
$endif$

$endif$

<!-- end_file: "_extensions/templates/tex/biblio.tex" -->


<!-- begin_file: "_extensions/templates/tex/after-body.tex" -->
<!-- end_file: "_extensions/templates/tex/after-body.tex" -->


<!-- begin_file: "_extensions/templates/tex/latex.template" -->% Options for packages loaded elsewhere
\PassOptionsToPackage{unicode$for(hyperrefoptions)$,$hyperrefoptions$$endfor$}{hyperref}
\PassOptionsToPackage{hyphens}{url}
$if(colorlinks)$
\PassOptionsToPackage{dvipsnames,svgnames,x11names}{xcolor}
$endif$
$if(CJKmainfont)$
\PassOptionsToPackage{space}{xeCJK}
$endif$
%


\documentclass[
$if(fontsize)$
  $fontsize$,
$endif$
$if(papersize)$
  $papersize$paper,
$endif$
$if(beamer)$
  ignorenonframetext,
$if(handout)$
  handout,
$endif$
$if(aspectratio)$
  aspectratio=$aspectratio$,
$endif$
$endif$
$for(classoption)$
  $classoption$$sep$,
$endfor$
]{$documentclass$}


$if(beamer)$
$if(background-image)$
\usebackgroundtemplate{%
  \includegraphics[width=\paperwidth]{$background-image$}%
}
% In beamer background-image does not work well when other images are used, so this is the workaround
\pgfdeclareimage[width=\paperwidth,height=\paperheight]{background}{$background-image$}
\usebackgroundtemplate{\pgfuseimage{background}}
$endif$
\usepackage{pgfpages}
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{caption label separator}{: }
\setbeamercolor{caption name}{fg=normal text.fg}
\beamertemplatenavigationsymbols$if(navigation)$$navigation$$else$empty$endif$
$for(beameroption)$
\setbeameroption{$beameroption$}
$endfor$
% Prevent slide breaks in the middle of a paragraph
\widowpenalties 1 10000
\raggedbottom
$if(section-titles)$
\setbeamertemplate{part page}{
  \centering
  \begin{beamercolorbox}[sep=16pt,center]{part title}
    \usebeamerfont{part title}\insertpart\par
  \end{beamercolorbox}
}
\setbeamertemplate{section page}{
  \centering
  \begin{beamercolorbox}[sep=12pt,center]{part title}
    \usebeamerfont{section title}\insertsection\par
  \end{beamercolorbox}
}
\setbeamertemplate{subsection page}{
  \centering
  \begin{beamercolorbox}[sep=8pt,center]{part title}
    \usebeamerfont{subsection title}\insertsubsection\par
  \end{beamercolorbox}
}
\AtBeginPart{
  \frame{\partpage}
}
\AtBeginSection{
  \ifbibliography
  \else
    \frame{\sectionpage}
  \fi
}
\AtBeginSubsection{
  \frame{\subsectionpage}
}
$endif$
$endif$
$if(beamerarticle)$
\usepackage{beamerarticle} % needs to be loaded first
$endif$
\usepackage{amsmath,amssymb}
$if(linestretch)$
\usepackage{setspace}
$endif$
\usepackage{iftex}
\ifPDFTeX
  \usepackage[$if(fontenc)$$fontenc$$else$T1$endif$]{fontenc}
  \usepackage[utf8]{inputenc}
  \usepackage{textcomp} % provide euro and other symbols
\else % if luatex or xetex
$if(mathspec)$
  \ifXeTeX
    \usepackage{mathspec} % this also loads fontspec
  \else
    \usepackage{unicode-math} % this also loads fontspec
  \fi
$else$
  \usepackage{unicode-math} % this also loads fontspec
$endif$
  \defaultfontfeatures{Scale=MatchLowercase}$-- must come before Beamer theme
  \defaultfontfeatures[\rmfamily]{Ligatures=TeX,Scale=1}
\fi
$if(fontfamily)$
$else$
$-- Set default font before Beamer theme so the theme can override it
\usepackage{lmodern}
$endif$
$-- Set Beamer theme before user font settings so they can override theme
$if(beamer)$
$if(theme)$
\usetheme[$for(themeoptions)$$themeoptions$$sep$,$endfor$]{$theme$}
$endif$
$if(colortheme)$
\usecolortheme{$colortheme$}
$endif$
$if(fonttheme)$
\usefonttheme{$fonttheme$}
$endif$
$if(mainfont)$
\usefonttheme{serif} % use mainfont rather than sansfont for slide text
$endif$
$if(innertheme)$
\useinnertheme{$innertheme$}
$endif$
$if(outertheme)$
\useoutertheme{$outertheme$}
$endif$
$endif$
$-- User font settings (must come after default font and Beamer theme)
$if(fontfamily)$
\usepackage[$for(fontfamilyoptions)$$fontfamilyoptions$$sep$,$endfor$]{$fontfamily$}
$endif$
\ifPDFTeX\else
  % xetex/luatex font selection
$if(mainfont)$
  \setmainfont[$for(mainfontoptions)$$mainfontoptions$$sep$,$endfor$]{$mainfont$}
$endif$
$if(sansfont)$
  \setsansfont[$for(sansfontoptions)$$sansfontoptions$$sep$,$endfor$]{$sansfont$}
$endif$
$if(monofont)$
  \setmonofont[$for(monofontoptions)$$monofontoptions$$sep$,$endfor$]{$monofont$}
$endif$
$for(fontfamilies)$
  \newfontfamily{$fontfamilies.name$}[$for(fontfamilies.options)$$fontfamilies.options$$sep$,$endfor$]{$fontfamilies.font$}
$endfor$
$if(mathfont)$
$if(mathspec)$
  \ifXeTeX
    \setmathfont(Digits,Latin,Greek)[$for(mathfontoptions)$$mathfontoptions$$sep$,$endfor$]{$mathfont$}
  \else
    \setmathfont[$for(mathfontoptions)$$mathfontoptions$$sep$,$endfor$]{$mathfont$}
  \fi
$else$
  \setmathfont[$for(mathfontoptions)$$mathfontoptions$$sep$,$endfor$]{$mathfont$}
$endif$
$endif$
$if(CJKmainfont)$
  \ifXeTeX
    \usepackage{xeCJK}
    \setCJKmainfont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKmainfont$}
    $if(CJKsansfont)$
      \setCJKsansfont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKsansfont$}
    $endif$
    $if(CJKmonofont)$
      \setCJKmonofont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKmonofont$}
    $endif$
  \fi
$endif$
$if(luatexjapresetoptions)$
  \ifLuaTeX
    \usepackage[$for(luatexjapresetoptions)$$luatexjapresetoptions$$sep$,$endfor$]{luatexja-preset}
  \fi
$endif$
$if(CJKmainfont)$
  \ifLuaTeX
    \usepackage[$for(luatexjafontspecoptions)$$luatexjafontspecoptions$$sep$,$endfor$]{luatexja-fontspec}
    \setmainjfont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKmainfont$}
  \fi
$endif$
\fi
$if(zero-width-non-joiner)$
%% Support for zero-width non-joiner characters.
\makeatletter
\def\zerowidthnonjoiner{%
  % Prevent ligatures and adjust kerning, but still support hyphenating.
  \texorpdfstring{%
    \TextOrMath{\nobreak\discretionary{-}{}{\kern.03em}%
      \ifvmode\else\nobreak\hskip\z@skip\fi}{}%
  }{}%
}
\makeatother
\ifPDFTeX
  \DeclareUnicodeCharacter{200C}{\zerowidthnonjoiner}
\else
  \catcode`^^^^200c=\active
  \protected\def ^^^^200c{\zerowidthnonjoiner}
\fi
%% End of ZWNJ support
$endif$
% Use upquote if available, for straight quotes in verbatim environments
\IfFileExists{upquote.sty}{\usepackage{upquote}}{}
\IfFileExists{microtype.sty}{% use microtype if available
  \usepackage[$for(microtypeoptions)$$microtypeoptions$$sep$,$endfor$]{microtype}
  \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
}{}
$if(indent)$
$else$
\makeatletter
\@ifundefined{KOMAClassName}{% if non-KOMA class
  \IfFileExists{parskip.sty}{%
    \usepackage{parskip}
  }{% else
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{6pt plus 2pt minus 1pt}}
}{% if KOMA class
  \KOMAoptions{parskip=half}}
\makeatother
$endif$
$if(verbatim-in-note)$
\usepackage{fancyvrb}
$endif$
\usepackage{xcolor}
$if(geometry)$
$if(beamer)$
\geometry{$for(geometry)$$geometry$$sep$,$endfor$}
$else$
\usepackage[$for(geometry)$$geometry$$sep$,$endfor$]{geometry}
$endif$
$endif$
$if(beamer)$
\newif\ifbibliography
$endif$
$if(listings)$
\usepackage{listings}
\newcommand{\passthrough}[1]{#1}
\lstset{defaultdialect=[5.3]Lua}
\lstset{defaultdialect=[x86masm]Assembler}
$endif$
$if(lhs)$
\lstnewenvironment{code}{\lstset{language=Haskell,basicstyle=\small\ttfamily}}{}
$endif$


$if(highlighting-macros)$
$highlighting-macros$
$endif$


$if(tables)$
\usepackage{longtable,booktabs,array}
$if(multirow)$
\usepackage{multirow}
$endif$
\usepackage{calc} % for calculating minipage widths
$if(beamer)$
\usepackage{caption}
% Make caption package work with longtable
\makeatletter
\def\fnum@table{\tablename~\thetable}
\makeatother
$else$
% Correct order of tables after \paragraph or \subparagraph
\usepackage{etoolbox}
\makeatletter
\patchcmd\longtable{\par}{\if@noskipsec\mbox{}\fi\par}{}{}
\makeatother
% Allow footnotes in longtable head/foot
\IfFileExists{footnotehyper.sty}{\usepackage{footnotehyper}}{\usepackage{footnote}}
\makesavenoteenv{longtable}
$endif$
$endif$


$if(graphics)$
\usepackage{graphicx}
\makeatletter
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
\makeatother
% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
% Set default figure placement to htbp
\makeatletter
\def\fps@figure{htbp}
\makeatother
$endif$


$if(svg)$
\usepackage{svg}
$endif$
$if(strikeout)$
$-- also used for underline
\ifLuaTeX
  \usepackage{luacolor}
  \usepackage[soul]{lua-ul}
\else
  \usepackage{soul}
\fi
$endif$
\setlength{\emergencystretch}{3em} % prevent overfull lines
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
$if(numbersections)$
\setcounter{secnumdepth}{$if(secnumdepth)$$secnumdepth$$else$5$endif$}
$else$
\setcounter{secnumdepth}{-\maxdimen} % remove section numbering
$endif$
$if(subfigure)$
\usepackage{subcaption}
$endif$
$if(beamer)$
$else$
$if(block-headings)$
% Make \paragraph and \subparagraph free-standing
\ifx\paragraph\undefined\else
  \let\oldparagraph\paragraph
  \renewcommand{\paragraph}[1]{\oldparagraph{#1}\mbox{}}
\fi
\ifx\subparagraph\undefined\else
  \let\oldsubparagraph\subparagraph
  \renewcommand{\subparagraph}[1]{\oldsubparagraph{#1}\mbox{}}
\fi
$endif$
$endif$
$if(pagestyle)$
\pagestyle{$pagestyle$}
$endif$


$if(csl-refs)$
\newlength{\cslhangindent}
\setlength{\cslhangindent}{1.5em}
\newlength{\csllabelwidth}
\setlength{\csllabelwidth}{3em}
\newlength{\cslentryspacingunit} % times entry-spacing
\setlength{\cslentryspacingunit}{\parskip}
\newenvironment{CSLReferences}[2] % #1 hanging-ident, #2 entry spacing
 {% don't indent paragraphs
  \setlength{\parindent}{0pt}
  % turn on hanging indent if param 1 is 1
  \ifodd #1
  \let\oldpar\par
  \def\par{\hangindent=\cslhangindent\oldpar}
  \fi
  % set entry spacing
  \setlength{\parskip}{#2\cslentryspacingunit}
 }%
 {}
\usepackage{calc}
\newcommand{\CSLBlock}[1]{#1\hfill\break}
\newcommand{\CSLLeftMargin}[1]{\parbox[t]{\csllabelwidth}{#1}}
\newcommand{\CSLRightInline}[1]{\parbox[t]{\linewidth - \csllabelwidth}{#1}\break}
\newcommand{\CSLIndent}[1]{\hspace{\cslhangindent}#1}
$endif$


$if(lang)$
\ifLuaTeX
\usepackage[bidi=basic]{babel}
\else
\usepackage[bidi=default]{babel}
\fi
$if(babel-lang)$
\babelprovide[main,import]{$babel-lang$}
$if(mainfont)$
\ifPDFTeX
\else
\babelfont[$babel-lang$]{rm}[$for(mainfontoptions)$$mainfontoptions$$sep$,$endfor$]{$mainfont$}
\fi
$endif$
$endif$
$for(babel-otherlangs)$
\babelprovide[import]{$babel-otherlangs$}
$endfor$
$for(babelfonts/pairs)$
\babelfont[$babelfonts.key$]{rm}{$babelfonts.value$}
$endfor$
% get rid of language-specific shorthands (see #6817):
\let\LanguageShortHands\languageshorthands
\def\languageshorthands#1{}
$endif$
$for(header-includes)$
$header-includes$
$endfor$
\ifLuaTeX
  \usepackage{selnolig}  % disable illegal ligatures
\fi
$if(dir)$
\ifPDFTeX
  \TeXXeTstate=1
  \newcommand{\RL}[1]{\beginR #1\endR}
  \newcommand{\LR}[1]{\beginL #1\endL}
  \newenvironment{RTL}{\beginR}{\endR}
  \newenvironment{LTR}{\beginL}{\endL}
\fi
$endif$
$if(natbib)$
\usepackage[$natbiboptions$]{natbib}
\bibliographystyle{$if(biblio-style)$$biblio-style$$else$plainnat$endif$}
$endif$
$if(biblatex)$
\usepackage[$if(biblio-style)$style=$biblio-style$,$endif$$for(biblatexoptions)$$biblatexoptions$$sep$,$endfor$]{biblatex}
$for(bibliography)$
\addbibresource{$bibliography$}
$endfor$
$endif$
$if(nocite-ids)$
\nocite{$for(nocite-ids)$$it$$sep$, $endfor$}
$endif$
$if(csquotes)$
\usepackage{csquotes}
$endif$
\IfFileExists{bookmark.sty}{\usepackage{bookmark}}{\usepackage{hyperref}}
\IfFileExists{xurl.sty}{\usepackage{xurl}}{} % add URL line breaks if available
\urlstyle{$if(urlstyle)$$urlstyle$$else$same$endif$}
$if(links-as-notes)$
% Make links footnotes instead of hotlinks:
\DeclareRobustCommand{\href}[2]{#2\footnote{\url{#1}}}
$endif$
$if(verbatim-in-note)$
\VerbatimFootnotes % allow verbatim text in footnotes
$endif$
\hypersetup{
$if(title-meta)$
  pdftitle={$title-meta$},
$endif$
$if(author-meta)$
  pdfauthor={$author-meta$},
$endif$
$if(lang)$
  pdflang={$lang$},
$endif$
$if(subject)$
  pdfsubject={$subject$},
$endif$
$if(keywords)$
  pdfkeywords={$for(keywords)$$keywords$$sep$, $endfor$},
$endif$
$if(colorlinks)$
  colorlinks=true,
  linkcolor={$if(linkcolor)$$linkcolor$$else$Maroon$endif$},
  filecolor={$if(filecolor)$$filecolor$$else$Maroon$endif$},
  citecolor={$if(citecolor)$$citecolor$$else$Blue$endif$},
  urlcolor={$if(urlcolor)$$urlcolor$$else$Blue$endif$},
$else$
$if(boxlinks)$
$else$
  hidelinks,
$endif$
$endif$
  pdfcreator={LaTeX via pandoc}}


$if(title)$
\title{$title$$if(thanks)$\thanks{$thanks$}$endif$}
$endif$
$if(subtitle)$
$if(beamer)$
$else$
\usepackage{etoolbox}
\makeatletter
\providecommand{\subtitle}[1]{% add subtitle to \maketitle
  \apptocmd{\@title}{\par {\large #1 \par}}{}{}
}
\makeatother
$endif$
\subtitle{$subtitle$}
$endif$
\author{$for(author)$$author$$sep$ \and $endfor$}
\date{$date$}
$if(beamer)$
$if(institute)$
\institute{$for(institute)$$institute$$sep$ \and $endfor$}
$endif$
$if(titlegraphic)$
\titlegraphic{\includegraphics{$titlegraphic$}}
$endif$
$if(logo)$
\logo{\includegraphics{$logo$}}
$endif$
$endif$


\begin{document}


$if(has-frontmatter)$
\frontmatter
$endif$
$if(title)$
$if(beamer)$
\frame{\titlepage}
$else$
\maketitle
$endif$
$if(abstract)$
\begin{abstract}
$abstract$
\end{abstract}
$endif$
$endif$


$for(include-before)$
$include-before$

$endfor$


$if(toc)$
$if(toc-title)$
\renewcommand*\contentsname{$toc-title$}
$endif$
$if(beamer)$
\begin{frame}[allowframebreaks]
$if(toc-title)$
  \frametitle{$toc-title$}
$endif$
  \tableofcontents[hideallsubsections]
\end{frame}
$else$
{
$if(colorlinks)$
\hypersetup{linkcolor=$if(toccolor)$$toccolor$$else$$endif$}
$endif$
\setcounter{tocdepth}{$toc-depth$}
\tableofcontents
}
$endif$
$endif$
$if(lof)$
\listoffigures
$endif$
$if(lot)$
\listoftables
$endif$


$if(linestretch)$
\setstretch{$linestretch$}
$endif$
$if(has-frontmatter)$
\mainmatter
$endif$
$body$

$if(has-frontmatter)$
\backmatter
$endif$


$if(natbib)$
$if(bibliography)$
$if(biblio-title)$
$if(has-chapters)$
\renewcommand\bibname{$biblio-title$}
$else$
\renewcommand\refname{$biblio-title$}
$endif$
$endif$
$if(beamer)$
\begin{frame}[allowframebreaks]{$biblio-title$}
  \bibliographytrue
$endif$
  \bibliography{$for(bibliography)$$bibliography$$sep$,$endfor$}
$if(beamer)$
\end{frame}
$endif$

$endif$
$endif$
$if(biblatex)$
$if(beamer)$
\begin{frame}[allowframebreaks]{$biblio-title$}
  \bibliographytrue
  \printbibliography[heading=none]
\end{frame}
$else$
\printbibliography$if(biblio-title)$[title=$biblio-title$]$endif$
$endif$

$endif$

$for(include-after)$
$include-after$

$endfor$


\end{document}

<!-- end_file: "_extensions/templates/tex/latex.template" -->


<!-- begin_file: "_extensions/templates/tex/tightlist.tex" -->\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

<!-- end_file: "_extensions/templates/tex/tightlist.tex" -->


<!-- begin_file: "_extensions/templates/tex/tables.tex" -->$if(tables)$
\usepackage{longtable,booktabs,array}
$if(multirow)$
\usepackage{multirow}
$endif$
\usepackage{calc} % for calculating minipage widths
$if(beamer)$
\usepackage{caption}
% Make caption package work with longtable
\makeatletter
\def\fnum@table{\tablename~\thetable}
\makeatother
$else$
% Correct order of tables after \paragraph or \subparagraph
\usepackage{etoolbox}
\makeatletter
\patchcmd\longtable{\par}{\if@noskipsec\mbox{}\fi\par}{}{}
\makeatother
% Allow footnotes in longtable head/foot
\IfFileExists{footnotehyper.sty}{\usepackage{footnotehyper}}{\usepackage{footnote}}
\makesavenoteenv{longtable}
$endif$
$endif$

<!-- end_file: "_extensions/templates/tex/tables.tex" -->


<!-- begin_file: "_extensions/templates/tex/graphics.tex" -->$if(graphics)$
\usepackage{graphicx}
\makeatletter
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
\makeatother
% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
% Set default figure placement to htbp
\makeatletter
\def\fps@figure{htbp}
\makeatother
$endif$

<!-- end_file: "_extensions/templates/tex/graphics.tex" -->


<!-- begin_file: "_extensions/templates/tex/citations.tex" -->$if(csl-refs)$
% definitions for citeproc citations
\NewDocumentCommand\citeproctext{}{}
\NewDocumentCommand\citeproc{mm}{%
  \begingroup\def\citeproctext{#2}\cite{#1}\endgroup}
\makeatletter
 % allow citations to break across lines
 \let\@cite@ofmt\@firstofone
 % avoid brackets around text for \cite:
 \def\@biblabel#1{}
 \def\@cite#1#2{{#1\if@tempswa , #2\fi}}
\makeatother
\newlength{\cslhangindent}
\setlength{\cslhangindent}{1.5em}
\newlength{\csllabelwidth}
\setlength{\csllabelwidth}{3em}
\newenvironment{CSLReferences}[2] % #1 hanging-indent, #2 entry-spacing
 {\begin{list}{}{%
  \setlength{\itemindent}{0pt}
  \setlength{\leftmargin}{0pt}
  \setlength{\parsep}{0pt}
  % turn on hanging indent if param 1 is 1
  \ifodd #1
   \setlength{\leftmargin}{\cslhangindent}
   \setlength{\itemindent}{-1\cslhangindent}
  \fi
  % set entry spacing
  \setlength{\itemsep}{#2\baselineskip}}}
 {\end{list}}
\usepackage{calc}
\newcommand{\CSLBlock}[1]{\hfill\break\parbox[t]{\linewidth}{\strut\ignorespaces#1\strut}}
\newcommand{\CSLLeftMargin}[1]{\parbox[t]{\csllabelwidth}{\strut#1\strut}}
\newcommand{\CSLRightInline}[1]{\parbox[t]{\linewidth - \csllabelwidth}{\strut#1\strut}}
\newcommand{\CSLIndent}[1]{\hspace{\cslhangindent}#1}
$endif$

<!-- end_file: "_extensions/templates/tex/citations.tex" -->


<!-- begin_file: "_extensions/templates/typst/definitions.typ" -->// Some definitions presupposed by pandoc's typst output.
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

#let unescape-eval(str) = {
  return eval(str.replace("\\", ""))
}

#let empty(v) = {
  if type(v) == "string" {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$$")).at(0, default: none) != none
  } else if type(v) == "content" {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
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
  if type(it.kind) != "string" {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let old_title = old_title_block.body.body.children.at(2)

  // TODO use custom separator if available
  let new_title = if empty(old_title) {
    [#kind #it.counter.display()]
  } else {
    [#kind #it.counter.display(): #old_title]
  }

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

<!-- end_file: "_extensions/templates/typst/definitions.typ" -->


<!-- begin_file: "_extensions/templates/typst/typst-template.typ" -->
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
  font: "linux libertine",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "linux libertine",
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
 if title != none {
    align(center)[#block(inset: 2em)[
      #set par(leading: heading-line-height)
      #if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
           or heading-color != black or heading-decoration == "underline"
           or heading-background-color != none) {
        set text(font: heading-family, weight: heading-weight, style: heading-style, fill: heading-color)
        text(size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(size: subtitle-size)[#subtitle]
        }
      } else {
        text(weight: "bold", size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(weight: "bold", size: subtitle-size)[#subtitle]
        }
      }
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)


#show heading: it => [#h(2em) #it]

<!-- end_file: "_extensions/templates/typst/typst-template.typ" -->


<!-- begin_file: "_extensions/templates/typst/typst-show.typ" -->#show: doc => article(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$],
      affiliation: [$for(it.affiliations)$$it.name$$sep$, $endfor$],
      email: [$it.email$] ),
$endif$
$endfor$
    ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
  abstract-title: "$labels.abstract$",
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$elseif(brand.typography.base.family)$
  font: ("$brand.typography.base.family$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$elseif(brand.typography.base.size)$
  fontsize: $brand.typography.base.size$,
$endif$
$if(title)$
$if(brand.typography.headings.family)$
  heading-family: ("$brand.typography.headings.family$",),
$endif$
$if(brand.typography.headings.weight)$
  heading-weight: $brand.typography.headings.weight$,
$endif$
$if(brand.typography.headings.style)$
  heading-style: "$brand.typography.headings.style$",
$endif$
$if(brand.typography.headings.decoration)$
  heading-decoration: "$brand.typography.headings.decoration$",
$endif$
$if(brand.typography.headings.color)$
  heading-color: unescape-eval("$brand.typography.headings.color$"),
$endif$
$if(brand.typography.headings.background-color)$
  heading-background-color: unescape-eval("$brand.typography.headings.background-color$"),
$endif$
$if(brand.typography.headings.line-height)$
  heading-line-height: $brand.typography.headings.line-height$,
$endif$
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
$if(toc-title)$
  toc_title: [$toc-title$],
$endif$
$if(toc-indent)$
  toc_indent: $toc-indent$,
$endif$
  toc_depth: $toc-depth$,
  cols: $if(columns)$$columns$$else$1$endif$,
  doc,
)
<!-- end_file: "_extensions/templates/typst/typst-show.typ" -->


<!-- begin_file: "_extensions/templates/typst/notes.typ" -->$if(notes)$
#v(1em)
#block[
#horizontalrule
#set text(size: .88em)
#v(3pt) // otherwise first note marker is swallowed, bug?

$notes$
]
$endif$
<!-- end_file: "_extensions/templates/typst/notes.typ" -->


<!-- begin_file: "_extensions/templates/typst/biblio.typ" -->$if(citations)$
$if(csl)$ 
  
#set bibliography(style: "$csl$") 
$elseif(bibliographystyle)$ 

#set bibliography(style: "$bibliographystyle$")
$endif$
$if(bibliography)$

#bibliography($for(bibliography)$"$bibliography$"$sep$,$endfor$)
$endif$
$endif$
<!-- end_file: "_extensions/templates/typst/biblio.typ" -->


<!-- begin_file: "_extensions/templates/typst/orange/template.typ" -->#import "_extensions/templates/typst/orange/lib.typ": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, update-heading-image

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

$definitions.typ()$

$typst-template.typ()$

$typst-show.typ()$

$for(header-includes)$
$header-includes$
$endfor$

$for(include-before)$
$include-before$
$endfor$

$body$

$notes.typ()$

$biblio.typ()$

$for(include-after)$
$include-after$
$endfor$

<!-- end_file: "_extensions/templates/typst/orange/template.typ" -->


<!-- begin_file: "_extensions/templates/typst/orange/lib.typ" -->#import("my-outline.typ"): *
#import("my-index.typ"): *
#import("theorems.typ"): *

#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)
#let mathcal = (it) => {
  set text(size: 1.3em, font: "OPTIOriginal", fallback: false)
  it
  h(0.1em)
}

#let normal-text = 1em
#let large-text = 3em
#let huge-text = 16em
#let title-main-1 = 2.5em
#let title-main-2 = 1.8em
#let title-main-3 = 2.2em
#let title1 = 2.2em
#let title2 = 1.5em
#let title3 = 1.3em
#let title4 = 1.2em
#let title5 = 11pt

#let outline-part = 1.5em;
#let outline-heading1 = 1.3em;
#let outline-heading2 = 1.1em;
#let outline-heading3 = 1.1em;


#let nocite(citation) = {place(hide[#cite(citation)])}

#let language-state = state("language-state", none)
#let main-color-state = state("main-color-state", none)
#let appendix-state = state("appendix-state", none)
#let appendix-state-hide-parent = state("appendix-state-hide-parent", none)
#let heading-image = state("heading-image", none)
#let supplement-part-state = state("supplement_part", none)
#let part-style-state = state("part-style", 0)
#let part-state = state("part-state", none)
#let part-location = state("part-location", none)
#let part-counter = counter("part-counter")
#let part-change = state("part-change", false)

#let part(title) = {
  pagebreak(to: "odd")
  part-change.update(x =>
    true
  )
  part-state.update(x =>
    title
  )
  part-counter.step()
  [
    #context{
      let her = here()
      part-location.update(x =>
        her
      )
    }

    #context{
      let main-color = main-color-state.at(here())
      let part-style = part-style-state.at(here())
      let supplement_part = supplement-part-state.at(here())
      if part-style == 0 [
        #set par(justify: false)
        #place(block(width:100%, height:100%, outset: (x: 3cm, bottom: 2.5cm, top: 3cm), fill: main-color.lighten(70%)))
        #place(top+right, text(fill: black, size: large-text, weight: "bold", box(width: 60%, part-state.get())))
        #place(top+left, text(fill: main-color, size: huge-text, weight: "bold", part-counter.display("I")))
      ] else if part-style == 1 [
        #set par(justify: false)
        #place(block(width:100%, height:100%, outset: (x: 3cm, bottom: 2.5cm, top: 3cm), fill: main-color.lighten(70%)))
        #place(top+left)[
          #block(text(fill: black, size: 2.5em, weight: "bold", supplement_part + " " + part-counter.display("I")))
          #v(1cm, weak: true)
          #move(dx: -4pt, block(text(fill: main-color, size: 6em, weight: "bold", part-state.get())))
        ]
      ]
      align(bottom+right, my-outline-small(title, appendix-state, part-state, part-location,part-change,part-counter, main-color, textSize1: outline-part, textSize2: outline-heading1, textSize3: outline-heading2, textSize4: outline-heading3))
    }
  ]
}

#let chapter(title, image:none, l: none) = {
  heading-image.update(x =>
    image
  )
  if l != none [
    #heading(level: 1, title) #label(l)
  ] else [
    #heading(level: 1, title)
  ]
}

#let update-heading-image(image:none) = {
  heading-image.update(x =>
    image
  )
}

#let make-index(title: none) = {make-index-int(title:title, main-color-state: main-color-state)}

#let appendices(title, doc, hide-parent: false) = {
  counter(heading).update(0)
  appendix-state.update(x =>
    title
  )
  appendix-state-hide-parent.update(x =>
    hide-parent
  )
  set heading ( numbering: (..nums) => {
      let vals = nums.pos()
      if vals.len() == 1 {return str(numbering("A.1", ..vals)) + "."}
      else {
        context{
          let main-color = main-color-state.at(here())
          let color = main-color
          if vals.len() == 4 {color = black}
          return place(dx:-4.5cm, box(width: 4cm, align(right, text(fill: color)[#numbering("A.1", ..vals)])))
        }
      }
    },
  )
  doc
}

#let my-bibliography(file, image:none) = {
  counter(heading).update(0)
  heading-image.update(x =>
    image
  )
  file
}

#let theorem(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("theorem", if language=="en" {"Theorem"} else {"Teorema"},
    stroke: 0.5pt + main-color,
    radius: 0em,
    inset: 0.65em,
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => text(weight: "bold", fill: main-color, x),
    fill: black.lighten(95%),
    base_level: 1)(name:name, body)
  }
}

#let definition(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("definition", if language=="en" {"Definition"} else {"Definizione"},
    stroke: (left: 4pt + main-color),
    radius: 0em,
    inset: (x: 0.65em),
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => text(weight: "bold", x),
    base_level: 1)(name:name, body)
  }
}

#let corollary(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("corollary", if language=="en" {"Corollary"} else {"Corollario"},
    stroke: (left: 4pt + gray),
    radius: 0em,
    inset: 0.65em,
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => text(weight: "bold", x),
    fill: black.lighten(95%),
    base_level: 1)(name:name, body)
  }
}


#let proposition(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("proposition", if language=="en" {"Proposition"} else {"Proposizione"},
    radius: 0em,
    inset: 0em,
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => text(weight: "bold", fill: main-color, x),
    base_level: 1)(name:name, body)
  }
}


#let notation(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("notation", if language=="en" {"Notation"} else {"Nota"},
    stroke: none,
    radius: 0em,
    inset: 0em,
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => text(weight: "bold", x),
    base_level: 1)(name:name, body)
  }
}

#let exercise(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("exercise", if language=="en" {"Exercise"} else {"Esercizio"},
    stroke: (left: 4pt + main-color),
    radius: 0em,
    inset: 0.65em,
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => text(fill: main-color, weight: "bold", x),
    fill: main-color.lighten(90%),
    base_level: 1)(name:name, body)
  }
}

#let example(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("example", if language=="en" {"Example"} else {"Esempio"},
    stroke: none,
    radius: 0em,
    inset: 0em,
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => text(weight: "bold", x),
    base_level: 1)(name:name, body)
  }
}

#let problem(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("problem", if language=="en" {"Problem"} else {"Problema"},
    stroke: none,
    radius: 0em,
    inset: 0em,
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => text(fill: main-color, weight: "bold", x),
    base_level: 1)(name:name, body)
  }
}

#let vocabulary(name: none, body) = {
  context{
    let language = language-state.at(here())
    let main-color = main-color-state.at(here())
    thmbox("vocabulary", if language=="en" {"Vocabulary"} else {"Vocabolario"},
    stroke: none,
    radius: 0em,
    inset: 0em,
    namefmt: x => [*--- #x.*],
    separator: h(0.2em),
    titlefmt: x => [■ #text(weight: "bold", x)],
    base_level: 1)(name:name, body)
  }
}

#let remark(body) = {
   context{
    let main-color = main-color-state.at(here())
    set par(first-line-indent: 0em)
    grid(
    columns: (1.2cm, 1fr),
    align: (center, left),
    rows: (auto),
    circle(radius: 0.3cm, fill: main-color.lighten(70%), stroke: main-color.lighten(30%))[
      #set align(center + horizon)
      #set text(fill: main-color, weight: "bold")
      R
    ],
    body)
  }
}

#let book(title: "", subtitle: "", date: "", author: (), paper-size: "a4", logo: none, cover: none, image-index:none, body, main-color: blue, copyright: [], lang: "en", list-of-figure-title: none, list-of-table-title: none, supplement-chapter: "Chapter", supplement-part: "Part", font-size: 10pt, part-style: 0, lowercase-references: false) = {
  set document(author: author, title: title)
  set text(size: font-size, lang: lang)
  set par(leading: 0.5em)
  set enum(numbering: "1.a.i.")
  set list(marker: ([•], [--], [◦]))

  set ref (supplement: (it)=>{lower(it.supplement)}) if lowercase-references


  set math.equation(numbering: num =>
    numbering("(1.1)", counter(heading).get().first(), num)
  )

  set figure(numbering: num =>
    numbering("1.1", counter(heading).get().first(), num)
  )

  set figure(gap: 1.3em)

  show figure: it => align(center)[
    #it
    #if (it.placement == none){v(2.6em, weak: true)}
  ]

  show terms: set par(first-line-indent: 0em)

  set page(
    paper: paper-size,
    margin: (x: 3cm, bottom: 2.5cm, top: 3cm),
     header: context{
      set text(size: title5)
      let page_number = counter(page).at(here()).first()
      let odd_page = calc.odd(page_number)
      let part_change = part-change.at(here())
      // Are we on an odd page?
      // if odd_page {
      //   return text(0.95em, smallcaps(title))
      // }

      // Are we on a page that starts a chapter? (We also check
      // the previous page because some headings contain pagebreaks.)
      let all = query(heading.where(level: 1))
      if all.any(it => it.location().page() == page_number) or part_change {return}
      let appendix = appendix-state.at(here())
      if odd_page {
        let before = query(selector(heading.where(level: 2)).before(here()))
        let counterInt = counter(heading).at(here())
        if before != () and counterInt.len()> 2 {
          box(width: 100%, inset: (bottom: 5pt), stroke: (bottom: 0.5pt))[
            #text(if appendix != none {numbering("A.1", ..counterInt.slice(1,3)) + " " + before.last().body} else {numbering("1.1", ..counterInt.slice(1,3)) + " " + before.last().body})
            #h(1fr)
            #page_number
          ]
        }
      } else{
        let before = query(selector(heading.where(level: 1)).before(here()))
        let counterInt = counter(heading).at(here()).first()
        if before != () and counterInt > 0 {
          box(width: 100%, inset: (bottom: 5pt), stroke: (bottom: 0.5pt))[
            #page_number
            #h(1fr)
            #text(weight: "bold", if appendix != none {numbering("A.1", counterInt) + ". " + before.last().body} else{before.last().supplement + " " + str(counterInt) + ". " + before.last().body})
          ]
        }
      }
    }
  )

  show cite: it  => {
    show regex("\[(\d+)"): set text(main-color)
    it
  }

  set heading(
    // hanging-indent: 0pt,
    numbering: (..nums) => {
      let vals = nums.pos()
      let pattern = if vals.len() == 1 {"1."}
                    else if vals.len() <= 4 {"1.1"}
      if pattern != none {numbering(pattern, ..nums)}
    }
  )

  show heading.where(level: 1): set heading(supplement: supplement-chapter)

  show heading: it => {
    set text(size: font-size)
    if it.level == 1 {
      // pagebreak(to: "odd")
      //set par(justify: false)
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)
      counter(math.equation).update(0)
      context{
        let img = heading-image.at(here())
        if img != none {
          set image(width: 21cm, height: 9.4cm)
          place(move(dx: -3cm, dy: -3cm, img))
          place( move(dx: -3cm, dy: -3cm, block(width: 21cm, height: 9.4cm, align(right + bottom, pad(bottom: 1.2cm, block(
            width: 86%,
            stroke: (
                right: none,
                rest: 2pt + main-color,
            ),
            inset: (left:2em, rest: 1.6em),
            fill: rgb("#FFFFFFAA"),
            radius: (
                right: 0pt,
                left: 10pt,
            ),
            align(left, text(size: title1, it))
          ))))))
          v(8.4cm)
      }
      else{
        move(dx: 3cm, dy: -0.5cm, align(right + top, block(
            width: 100% + 3cm,
            stroke: (
                right: none,
                rest: 2pt + main-color,
            ),
            inset: (left:2em, rest: 1.6em),
            fill: white,
            radius: (
                right: 0pt,
                left: 10pt,
            ),
            align(left, text(size: title1, it))
          )))
        v(1.5cm, weak: true)
      }
      }
      part-change.update(x =>
        false
      )
    }
    else if it.level == 2 or it.level == 3 or it.level == 4 {
      let size
      let space
      let color = main-color
      if it.level == 2 {
        size= title2
        space = 1em
      }
      else if it.level == 3 {
        size= title3
        space = 0.9em
      }
      else {
        size= title4
        space = 0.7em
        color = black
      }
      set text(size: size)
      let number = if it.numbering != none {
        set text(fill: main-color) if it.level < 4
        let num = counter(heading).display(it.numbering)
        let width = measure(num).width
        let gap = 7mm
        place(dx: -width - gap, num)
      }
      block(number + it.body)
      v(space, weak: true)
    }
    else {it}
  }

  set underline(offset: 3pt)

  // Title page.
  page(margin: 0cm, header: none)[
    #set text(fill: black)
    #language-state.update(x => lang)
    #main-color-state.update(x => main-color)
    #part-style-state.update(x => part-style)
    #supplement-part-state.update(x => supplement-part)
    //#place(top, image("images/background2.jpg", width: 100%, height: 50%))
    #if cover != none {
      set image(width: 100%, height: 100%)
      place(bottom, cover)
    }
    #if logo != none {
        set image(width: 3cm)
        place(top + center, pad(top:1cm, logo))
    }
    #align(center + horizon, block(width: 100%, fill: main-color.lighten(70%), height: 7.5cm, pad(x:2cm, y:1cm)[
      #par(leading: 0.4em)[
        #text(size: title-main-1, weight: "black", title)
      ]
      #v(1cm, weak: true)
      #text(size: title-main-2, subtitle)
      #v(1cm, weak: true)
      #text(size: title-main-3, weight: "bold", author)
    ]))
  ]
  if (copyright!=none){
    set text(size: 10pt)
    show link: it => [
      #set text(fill: main-color)
      #it
    ]
    // set par(spacing: 2em)
    align(bottom, copyright)
  }

  heading-image.update(x =>
    image-index
  )

  my-outline(appendix-state, appendix-state-hide-parent, part-state, part-location,part-change,part-counter, main-color, textSize1: outline-part, textSize2: outline-heading1, textSize3: outline-heading2, textSize4: outline-heading3)

  my-outline-sec(list-of-figure-title, figure.where(kind: image), outline-heading3)

  my-outline-sec(list-of-table-title, figure.where(kind: table), outline-heading3)


  // Main body.
  set par(
    first-line-indent: 1em,
    justify: true,
    // spacing: 0.5em
  )
  set block(spacing: 1.2em)
  show link: set text(fill: main-color)

  body

}


<!-- end_file: "_extensions/templates/typst/orange/lib.typ" -->


<!-- begin_file: "_extensions/templates/typst/orange/my-index.typ" -->#let classes = (main: "Main")
#let index_string = "my_index"

#let index(content) = place(hide(
figure(
    classes.main,
    caption: content,
    numbering: none,
    kind: index_string
)))

#let make-index-int(title: none, main-color-state:none) = {

    let content-text(content) = {
        let ct = ""
        if content.has("text") {
            ct = content.text
        }
        else {
            for cc in content.children {
                if cc.has("text") {
                    ct += cc.text
                }
            }
        }
        return ct
    }
    
    set par(first-line-indent: 0em)
    context{
        let main-color = main-color-state.at(here())
            let elements = query(selector(figure.where(kind: index_string)).before(here()))
        let words = (:)
        for el in elements {
            let ct = ""
            if el.caption.has("body"){
                ct = content-text(el.caption.body)
            }
            else{
                ct = content-text(el.caption)
            }

            // Have we already know that entry text? If not,
            // add it to our list of entry words
            if words.keys().contains(ct) != true {
                words.insert(ct, ())
            }

            // Add the new page entry to the list.
            let ent = (class: el.body.text, page: el.location().page())
            if not words.at(ct).contains(ent){
                words.at(ct).push(ent)
            }
        }


        let sortedkeys = words.keys().sorted()

        let register = ""
        if title != none {
            heading(level: 1, numbering: none, title)
        }
        block(columns(2,gutter: 1cm, [
            #for sk in sortedkeys [
                #let formattedPageNumbers = words.at(sk).map(en => {
                    link((page: en.page, x:0pt, y:0pt), text(fill: black, str(en.page)))
                })
                    #let firstCharacter = sk.first()
                    #if firstCharacter != register {
                        v(1em, weak:true)
                        box(width: 100%, fill: main-color.lighten(60%), inset: 5pt, align(center, text(size: 1.1em, weight: "bold", firstCharacter)))
                        register = firstCharacter
                        v(1em, weak:true)
                    }
                    #set text(size: 0.9em)
                    #if(sk.contains("!")){
                        h(2em)
                        sk.slice(sk.position("!")+1)
                    }else{
                     sk
                    }
                    #box(width: 1fr, repeat(text(weight: "regular")[. #h(4pt)])) 
                    #formattedPageNumbers.join(",")
                    #v(0.65em, weak:true)
        ]
        ]))
    }
}

<!-- end_file: "_extensions/templates/typst/orange/my-index.typ" -->


<!-- begin_file: "_extensions/templates/typst/orange/my-outline.typ" -->#let my-outline-row( textSize:none,
                    textWeight: "regular",
                    insetSize: 0pt,
                    textColor: blue,
                    number: "0",
                    title: none,
                    heading_page: "0",
                    location: none) = {
  set text(size: textSize, fill: textColor, weight: textWeight)
  box(width: 1.1cm, inset: (y: insetSize), align(left, number))
  h(0.1cm)
  box(inset: (y: insetSize), width: 100% - 1.2cm, )[
    #link(location, title)
    #box(width: 1fr, repeat(text(weight: "regular")[. #h(4pt)])) 
    #link(location, heading_page)
  ]
}

#let my-outline(appendix-state, appendix-state-hide-parent, part-state, part-location,part-change,part-counter, main-color, textSize1:none, textSize2:none, textSize3:none, textSize4:none) = {
  show outline.entry: it => {
    let appendix-state = appendix-state.at(it.element.location())
    let appendix-state-hide-parent = appendix-state-hide-parent.at(it.element.location())
    let numberingFormat = if appendix-state != none {"A.1"} else {"1.1"}
    let counterInt = counter(heading).at(it.element.location())
    let number = none
    if counterInt.first() >0 {
      number = numbering(numberingFormat, ..counterInt)
    }
    let title = it.element.body
    let heading_page = it.page

    if it.level == 1 {
      let part-state = part-state.at(it.element.location())
      let part-location = part-location.at(it.element.location())
      let part-change = part-change.at(it.element.location())
      let part-counter = part-counter.at(it.element.location())
      if (part-change){
        v(0.7cm, weak: true)
        box(width: 1.1cm, fill: main-color.lighten(80%), inset: 5pt, align(center, text(size: textSize1, weight: "bold", fill: main-color.lighten(30%), numbering("I",part-counter.first()))))
        h(0.1cm)
        box(width: 100% - 1.2cm, fill: main-color.lighten(60%), inset: 5pt, align(center, link(part-location,text(size: textSize1, weight: "bold", part-state))))
        v(0.45cm, weak: true)
      }
      else{
        v(0.5cm, weak: true)
      }
      if (counterInt.first() == 1 and appendix-state != none and not appendix-state-hide-parent ){
        my-outline-row(insetSize: 2pt, textWeight: "bold", textSize: textSize2, textColor:main-color, number: none, title: appendix-state, heading_page: heading_page, location: it.element.location())
        v(0.5cm, weak: true)
      }
      my-outline-row(insetSize: 2pt, textWeight: "bold", textSize: textSize2, textColor:main-color, number: number, title: title, heading_page: heading_page, location: it.element.location())
    }
    else if it.level ==2 {
      my-outline-row(insetSize: 2pt, textWeight: "bold", textSize: textSize3, textColor:black, number: number, title: title, heading_page: heading_page, location: it.element.location())
    } else {
       my-outline-row(textWeight: "regular", textSize: textSize4, textColor:black, number: number, title: title, heading_page: heading_page, location: it.element.location())
    }
  }
  outline(depth: 3, indent: false)
}

#let my-outline-small(partTitle, appendix-state, part-state, part-location,part-change,part-counter, main-color, textSize1:none, textSize2:none, textSize3:none, textSize4:none) = {
  show outline.entry: it => {
    let appendix-state = appendix-state.at(it.element.location())
    let numberingFormat = if appendix-state != none {"A.1"} else {"1.1"}
    let counterInt = counter(heading).at(it.element.location())
    let number = none
    if counterInt.first() >0 {
      number = numbering(numberingFormat, ..counterInt)
    }
    let title = it.element.body
    let heading_page = it.page
    let part-state = part-state.at(it.element.location())
    if (part-state == partTitle and counterInt.first() >0 and appendix-state==none){
      if it.level == 1 {
        v(0.5cm, weak: true)
        my-outline-row(insetSize: 1pt, textWeight: "bold", textSize: textSize2, textColor:main-color, number: number, title: title, heading_page: heading_page, location: it.element.location())
      }
      else if it.level ==2 {
        my-outline-row(textWeight: "regular", textSize: textSize4, textColor:black, number: number, title: text(fill: black, title), heading_page: text(fill: black, heading_page), location: it.element.location())
      }
    }
    else{
      v(-0.65em, weak: true)
    }
  }
  box(width: 9.5cm, outline(depth: 2, indent: false, title: none))
}

#let my-outline-sec(list-of-figure-title, target, textSize) = {
  show outline.entry.where(level: 1): it => {
    let heading_page = it.page
    [
      #set text(size: textSize)
      #box(width: 0.75cm, align(right, [#it.body.at("children").at(2) #h(0.2cm)]))
      #link(it.element.location(), it.element.at("caption").body)
      #box(width: 1fr, repeat(text(weight: "regular")[. #h(4pt)])) 
      #link(it.element.location(),heading_page)
    ]
  }
  outline(
    title: list-of-figure-title,
    target: target,
  )
}

<!-- end_file: "_extensions/templates/typst/orange/my-outline.typ" -->


<!-- begin_file: "_extensions/templates/typst/orange/theorems.typ" -->// Store theorem environment numbering

#let thmcounters = state(
  "thm",
  (
    "counters": ("heading": ()),
    "latest": (),
  ),
)


#let thmenv(identifier, base, base_level, fmt) = {

  let global_numbering = numbering

  return (
    body,
    name: none,
    numbering: "1.1",
    base: base,
    base_level: base_level,
  ) => {
    set par(first-line-indent: 0em)
    let number = none
    if not numbering == none {
      context {
        let her = here()
        thmcounters.update(thmpair => {
          let counters = thmpair.at("counters")
          // Manually update heading counter
          counters.at("heading") = counter(heading).at(her)
          if not identifier in counters.keys() {
            counters.insert(identifier, (0,))
          }

          let tc = counters.at(identifier)
          if base != none {
            let bc = counters.at(base)

            // Pad or chop the base count
            if base_level != none {
              if bc.len() < base_level {
                bc = bc + (0,) * (base_level - bc.len())
              } else if bc.len() > base_level {
                bc = bc.slice(0, base_level)
              }
            }

            // Reset counter if the base counter has updated
            if tc.slice(0, -1) == bc {
              counters.at(identifier) = (..bc, tc.last() + 1)
            } else {
              counters.at(identifier) = (..bc, 1)
            }
          } else {
            // If we have no base counter, just count one level
            counters.at(identifier) = (tc.last() + 1,)
            let latest = counters.at(identifier)
          }

          let latest = counters.at(identifier)
          return (
            "counters": counters,
            "latest": latest,
          )
        })
      }

      number = context {
        global_numbering(numbering, ..thmcounters.get().at("latest"))
      }
    }

    fmt(name, number, body)
  }
}


#let thmref(
  label,
  fmt: auto,
  makelink: true,
  ..body,
) = {
  if fmt == auto {
    fmt = (nums, body) => {
      if body.pos().len() > 0 {
        body = body.pos().join(" ")
        return [#body #numbering("1.1", ..nums)]
      }
      return numbering("1.1", ..nums)
    }
  }

  context {
    let elements = query(label)
    let locationreps = elements.map(x => repr(x.location().position())).join(", ")
    assert(
      elements.len() > 0,
      message: "label <" + str(label) + "> does not exist in the document: referenced at " + repr(here().position()),
    )
    assert(
      elements.len() == 1,
      message: "label <" + str(label) + "> occurs multiple times in the document: found at " + locationreps,
    )
    let target = elements.first().location()
    let number = thmcounters.at(target).at("latest")
    if makelink {
      return link(target, fmt(number, body))
    }
    return fmt(number, body)
  }
}


#let thmbox(
  identifier,
  head,
  fill: none,
  stroke: none,
  inset: 1.2em,
  radius: 0.3em,
  breakable: false,
  padding: (top: 0.5em, bottom: 0.5em),
  namefmt: x => [(#x)],
  titlefmt: strong,
  bodyfmt: x => x,
  separator: [#h(0.1em):#h(0.2em)],
  base: "heading",
  base_level: none,
) = {
  let boxfmt(name, number, body) = {
    if not name == none {
      name = [ #namefmt(name)]
    } else {
      name = []
    }
    let title = head
    if not number == none {
      title += " " + number
    }
    title = titlefmt(title)
    body = bodyfmt(body)
    block(
      fill: fill,
      stroke: stroke,
      spacing: 1.2em,
      inset: inset,
      width: 100%,
      radius: radius,
      breakable: breakable,
      [#title#name#separator#body],
    )
  }
  return thmenv(identifier, base, base_level, boxfmt)
}


#let thmplain = thmbox.with(
  padding: (top: 0em, bottom: 0em),
  breakable: true,
  inset: (top: 0em, left: 1.2em, right: 1.2em),
  namefmt: name => emph([(#name)]),
  titlefmt: emph,
)
<!-- end_file: "_extensions/templates/typst/orange/theorems.typ" -->


<!-- begin_file: "_extensions/templates/typst/orange/typst-template.typ" -->
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

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)


#show heading: it => [#h(2em) #it]


<!-- end_file: "_extensions/templates/typst/orange/typst-template.typ" -->


<!-- begin_file: "_extensions/citetools/_extension.yml" -->name: citetools
author: Albert Krewinkel & Bernardo CDA Vasconcelos
version: 1.0.4
contributes:
  filters:
    - citeproc.lua
    - multiple-bibliographies.lua
    - citefield.lua
    - citation-backlinks.lua
  format:
    common:
      verbosity: ERROR
      citeproc: false
      link-citations: true
      validate-yaml: false

<!-- end_file: "_extensions/citetools/_extension.yml" -->


<!-- begin_file: "_extensions/citetools/citation-backlinks.lua" -->-- Todo: even with link-citations and link-fields turned off, citation-backlinks still adds a single backlink to each reference in the final bibliography div.

--- citation-backlinks.lua -- adds citation backlinks to the bibliography
---
--- Copyright: © 2022 John MacFarlane and Albert Krewinkel
--- License: MIT -- see LICENSE for details

-- Makes sure users know if their pandoc version is too old for this
-- filter.
PANDOC_VERSION:must_be_at_least '2.17'

-- cites is a table mapping citation item identifiers
-- to an array of cite identifiers
local cites = {}

-- counter for cite identifiers
local cite_number = 1

local function with_latex_label(s, el)
  if FORMAT == "latex" then
    -- return {pandoc.RawInline("latex", "\\pagelabel{" .. s .. "}"), el}
    return {pandoc.RawInline("latex", "\\label{" .. s .. "}"), el}
  else
    return {el}
  end
end

function Cite(el)
  local cite_id = "cite_" .. cite_number
  cite_number = cite_number + 1
  for _,citation in ipairs(el.citations) do
    if cites[citation.id] then
      table.insert(cites[citation.id], cite_id)
    else
      cites[citation.id] = {cite_id}
    end
  end
  return pandoc.Span(with_latex_label(cite_id, el), pandoc.Attr(cite_id))
end

function append_inline(blocks, inlines)
  local last = blocks[#blocks]
  if last.t == 'Para' or last.t == 'Plain' then
    -- append to last block
    last.content:extend(inlines)
  else
    -- append as additional block
    blocks[#blocks + 1] = pandoc.Plain(inlines)
  end
  return blocks
end

function Div(el)
  local citation_id = el.identifier:match("ref%-(.+)")
  local tex_return_link = pandoc.RawInline("latex", "\\Acrobatmenu{GoBack}{$\\hookleftarrow$}")

  if citation_id then
    local backlinks = pandoc.Inlines{pandoc.Space(), pandoc.Str("[")}
    if FORMAT == "latex" then
      -- quarto.doc.include_text("in-header", [[ \newcommand\pagelabel{\phantomsection\label} ]])
      table.insert(backlinks, tex_return_link)
    end

    for i,cite_id in ipairs(cites[citation_id] or {}) do
      local marker = pandoc.Str(i)

      if FORMAT == "latex" then
        marker = pandoc.RawInline("latex", "\\pageref{" .. cite_id .. "}")
      end
      if #backlinks > 2 then
        table.insert(backlinks, pandoc.Str(","))
        table.insert(backlinks, pandoc.Space())
      end
      table.insert(backlinks, pandoc.Link(marker, "#"..cite_id))
    end
    if #backlinks > 2 then
      append_inline(el.content, backlinks .. {pandoc.Str("]")})
    end
    return el
  end
end
<!-- end_file: "_extensions/citetools/citation-backlinks.lua" -->


<!-- begin_file: "_extensions/citetools/citefield.lua" -->--- https://github.com/bcdavasconcelos/citefield
--- citefield.lua
--- 1.0.3
--- Copyright: © 2023 - Albert Krewinkel & Bernardo Vasconcelos
--- License: MIT -- see LICENSE for details

--- [@Citekey]{.csl_field}
--- to print any valid CSL field
--- [@Citekey]{.csl_field.} (with extra dot)
--- to do it without creating a link.

--- ATTENTION: *MUST* *RUN* *AFTER* *CITEPROC*.

PANDOC_VERSION:must_be_at_least '2.17'

local stringify = require 'pandoc.utils'.stringify

csl_fields = {"abstract", "accessed", "annote", "archive", "archive_collection", "archive_location", "archive-place", "author", "authority", "available-date", "call-number", "chair", "chapter-number", "citation-key", "citation-label", "citation-number", "collection-editor", "collection-number", "collection-title", "compiler", "composer", "container-author", "container-title", "container-title-short", "contributor", "curator", "dimensions", "director", "division", "DOI", "edition", "editor", "editor-translator", "editorial-director", "event", "event-date", "event-place", "event-title", "executive-producer", "first-reference-note-number", "genre", "guest", "host", "illustrator", "interviewer", "ISBN", "ISSN", "issue", "issued", "jurisdiction", "keyword", "language", "license", "locator", "medium", "narrator", "note", "number", "number-of-pages", "number-of-volumes", "organizer", "original-author", "original-date", "original-publisher", "original-publisher-place", "original-title", "page", "page-first", "part-number", "part-title", "performer", "PMCID", "PMID", "printing-number", "producer", "publisher", "publisher-place", "recipient", "references", "reviewed-author", "reviewed-genre", "reviewed-title", "scale", "script-writer", "section", "series-creator", "source", "status", "submitted", "supplement-number", "title", "title-short", "translator", "URL", "version", "volume", "volume-title", "year-suffix"}

function get_options(meta)
  if meta['link-citations'] or meta['link-fields'] or meta['title-field-emphasis'] then
      return {link_citations = meta['link-citations'], link_fields = meta['link-fields'], title_field_emph = meta['title-field-emphasis']}
  else
      return {}
  end
end

local function has_value(tab, val)
  for index, value in ipairs(tab) do
      if value == val then
          return true
      end
  end
  return false
end

function Pandoc (doc)

  doc.meta.references = pandoc.utils.references(doc)
  doc.meta.bibliography = nil

  return doc:walk{

    Span = function (span)

      -- check that the span contains only a single cite object
      local cite = span.content[1]
      local citations = cite and cite.citations or nil
      if #span.content == 1 and cite.t == 'Cite' and #citations == 1 then
        the_arg = stringify(span.classes[1])
        if span.classes[2] then -- note in use
          local extra_arg = stringify(span.classes[2])
        end
      -- check dotted to turn off linking
      if string.find(the_arg, ".", 1, true) then
        dotted = true
        the_arg = string.gsub(the_arg, "%.$", "")
        else
          dotted = false
      end
      -- check ordinal:to retrieve the first, second, third or forth author/editor/translator
      if string.find(the_arg, "_first", 1, true) then
        ordinal = 1
        the_arg = string.gsub(the_arg, "%_first$", "")
        else if string.find(the_arg, "_second", 1, true) then
          ordinal = 2
          the_arg = string.gsub(the_arg, "%_second$", "")
          else if string.find(the_arg, "_third", 1, true) then
            ordinal = 3
            the_arg = string.gsub(the_arg, "%_third$", "")
            else if string.find(the_arg, "_forth", 1, true) then
              ordinal = 4
              the_arg = string.gsub(the_arg, "%_fourth$", "")
              else
                ordinal = 1
              end
            end
          end
      end

      -- Simple error trap
      if has_value(csl_fields, the_arg) then
        else -- if field is not valid
          return "#ERROR: Invalid CSL Field#"
      end -- end of error trap

      local cite_id = citations[1].id -- get citekey
      local the_result = "" -- initialize result
      local ref = doc.meta.references:find_if( -- get reference
      function (r) return cite_id == r.id end
    ) -- end of get reference

      if ref and ref[the_arg] then -- if field is not empty
        local content = ref[the_arg] -- get field
        local title_field_emph = get_options(doc.meta).title_field_emph
        if the_arg == "author" or the_arg == "editor" or the_arg == "translator" then -- if field contains name
          if content[ordinal] then -- if name[ord] exists
            if content[ordinal]["family"] then -- if name[ord] contains family name
              the_result = ref[the_arg][ordinal]["family"] -- get family name
              else if ref[the_arg][ordinal]["literal"] then -- if name[ord] does not contain family name, but contains literal
                the_result = ref[the_arg][ordinal]["literal"]
              else -- if field does not contain family name or literal
                the_result = "#ERROR#"
              end
            end -- end of name exists
          else -- no name error
            print("ERROR: [".. cite_id .. "][" .. the_arg .. "][" .. ordinal .. "] is empty")
            return "#ERROR: [".. cite_id .. "][" .. the_arg .. "][" .. ordinal .. "] is empty#"
          end -- end of field contains name
        else if the_arg == "title" and title_field_emph ~= false then -- if field is a title
            the_result = pandoc.Emph{stringify(ref[the_arg])}
          else if the_arg == "title-short" and title_field_emph ~= false then -- if field is a short title
              the_result = pandoc.Emph{stringify(ref[the_arg])}
            else -- if field is not a name or a title
              the_result = stringify(ref[the_arg])
            end -- end of field is not a name or a title
          end -- end of field is a short title
        end -- end of field is a title
      else -- end of field is empty
        the_result = span
      end

      if dotted == true
      or the_arg == "notes"
      or the_arg == "abstract"
      or the_arg == "keyword"
      or the_arg == "annote"
      or get_options(doc.meta).link_citations == false
      then -- if field is not to be linked
        return the_result
      else -- if field is to be linked
        if get_options(doc.meta).link_citations == true and get_options(doc.meta).link_fields ~= false then
          the_result = pandoc.Link(the_result, "#ref-"..cite_id)
          cite.content = {the_result}
          return cite
        else -- if get_options(doc.meta).link_citations == true and get_options(doc.meta).link_fields == false then
          return the_result
        end
      end -- end of field is to be linked
    end -- end of span contains only a single cite object

  end -- end of Span

  } -- end of doc:walk

end -- end of Pandoc


--- The original version of this script was generously contributed by [Albert Krewinkel](https://github.com/sponsors/tarleb) to the [Pandoc-Dicuss mailing list](https://groups.google.com/g/pandoc-discuss/c/5gb64T4OU9Q). It is being shared with permission (and at the request) of the original author for the benefit of the community of Pandoc users.
--- The current version was butchered by Bernardo CDA Vasconcelos to include error msgs, csl-field validation, making all field retrievable (including items in lists), adding emph for titles. The code probably needs refactorying from someone that actually know something about Lua to make it simpler, but it works.
<!-- end_file: "_extensions/citetools/citefield.lua" -->


<!-- begin_file: "_extensions/citetools/citeproc.lua" -->-- Lua filter that behaves like `--citeproc`
function Pandoc (doc)
  return pandoc.utils.citeproc(doc)
end
<!-- end_file: "_extensions/citetools/citeproc.lua" -->


<!-- begin_file: "_extensions/citetools/multiple-bibliographies.lua" -->--[[
multiple-bibliographies -- create multiple bibliographies

Copyright © 2018-2021 Albert Krewinkel

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
]]
local List = require 'pandoc.List'
local utils = require 'pandoc.utils'
local stringify = utils.stringify
local run_json_filter = utils.run_json_filter

--- Collection of all cites in the document
local all_cites = {}
--- Document meta value
local doc_meta = pandoc.Meta{}

--- Div used by pandoc-citeproc to insert the bibliography.
local refs_div = pandoc.Div({}, pandoc.Attr('refs'))

-- Div filled by pandoc-citeproc with properties set according to
-- the output format and the attributes of cs:bibliography
local refs_div_with_properties

--- Run citeproc on a pandoc document
local citeproc
if utils.citeproc then
  -- Built-in Lua function
  citeproc = utils.citeproc
else
  -- Use pandoc as a citeproc processor
  citeproc = function (doc)
    local opts = {'--from=json', '--to=json', '--citeproc', '--quiet'}
    return run_json_filter(doc, 'pandoc', opts)
  end
end

--- Resolve citations in the document by combining all bibliographies
-- before running pandoc-citeproc on the full document.
local function resolve_doc_citations (doc)
  -- combine all bibliographies
  local meta = doc.meta
  local orig_bib = meta.bibliography
  meta.bibliography = pandoc.MetaList{orig_bib}
  for name, value in pairs(meta) do
    if name:match('^bibliography_') then
      table.insert(meta.bibliography, value)
    end
  end
  -- add dummy div to catch the created bibliography
  table.insert(doc.blocks, refs_div)
  -- resolve all citations
  -- doc = run_json_filter(doc, 'pandoc-citeproc')
  doc = citeproc(doc)
  doc.meta.references = pandoc.utils.references(doc)
  -- remove catch-all bibliography and keep it for future use
  refs_div_with_properties = table.remove(doc.blocks)
  -- restore bibliography to original value
  doc.meta.bibliography = orig_bib
  return doc
end

--- Explicitly create a new meta object with all fields relevant for
--- pandoc-citeproc.
local function meta_for_pandoc_citeproc (bibliography)
  -- We could just indiscriminately copy all meta fields, but let's be
  -- explicit about what's important.
  local fields = {
    'bibliography', 'references', 'csl', 'citation-style',
    'link-citations', 'citation-abbreviations', 'lang',
    'suppress-bibliography', 'reference-section-title',
    'notes-after-punctuation', 'nocite'
  }
  local new_meta = pandoc.Meta{}
  for _, field in ipairs(fields) do
    new_meta[field] = doc_meta[field]
  end
  new_meta.bibliography = bibliography
  return new_meta
end

--- Create a bibliography for a given topic. This acts on all divs whose
-- ID starts with "refs", followed by nothing but underscores and
-- alphanumeric characters.
local function create_topic_bibliography (div)
  local name = div.identifier:match('^refs([_%w-]*)$')
  local bibfile = name and doc_meta['bibliography' .. name]
  if not bibfile then
    return nil
  end
  local tmp_blocks = {pandoc.Para(all_cites), refs_div}
  local tmp_meta = meta_for_pandoc_citeproc(bibfile)
  local tmp_doc = pandoc.Pandoc(tmp_blocks, tmp_meta)
  local res = citeproc(tmp_doc, true) -- try to be quiet
  -- First block of the result contains the dummy paragraph, second is
  -- the refs Div filled by pandoc-citeproc.
  div.content = res.blocks[2].content
  -- Set the classes and attributes as pandoc-citeproc did it on refs_div
  div.classes = refs_div_with_properties.classes
  div.attributes = refs_div_with_properties.attributes
  return div
end

return {
  {
    -- Collect all citations and the doc's Meta value for other filters.
    Cite = function (c) all_cites[#all_cites + 1] = c end,
    Meta = function (m) doc_meta = m end,
  },
  { Pandoc = resolve_doc_citations },
  { Div = create_topic_bibliography },
}
<!-- end_file: "_extensions/citetools/multiple-bibliographies.lua" -->


<!-- begin_file: "_extensions/csl/abnt-phi.csl" --><?xml version="1.0" encoding="utf-8"?>
<style xmlns="http://purl.org/net/xbiblio/csl" version="1.0" class="in-text" demote-non-dropping-particle="never" default-locale="pt-BR">
  <!-- This style was edited with the Visual CSL Editor (https://editor.citationstyles.org/visualEditor/) -->
  <info>
    <title>ABNT-Phi (Português - Brasil)</title>
    <title-short>ABNT</title-short>
    <id>http://www.zotero.org/styles/abnt-phi</id>
    <link href="http://www.zotero.org/styles/abnt-phi" rel="self"/>
    <link href="https://forums.zotero.org/discussion/22148/how-to-apply-disambiguation-in-citation-just-when-works-of-different-authors-are-in-the-same-year/?Focus=147094#Comment_147094" rel="documentation"/>
    <author>
      <name>Juliana Geyna Régis</name>
      <email>juliana.regis@ipea.gov.br</email>
    </author>
    <contributor>
      <name>Lucas Mation</name>
      <email>lucas.mation@ipea.gov.br</email>
    </contributor>
    <contributor>
      <name>Eduardo Michelotti Bettoni</name>
      <email>webtur@ufpr.br</email>
    </contributor>
    <contributor>
      <name>Paulo Augusto Nascimento</name>
      <email>paulo.nascimento@ipea.gov.br</email>
    </contributor>
    <contributor>
      <name>Iuri Gavronski</name>
      <email>iuri at ufrgs dot br</email>
    </contributor>
    <contributor>
      <name>José Antonio Meira da Rocha</name>
      <email>joseantoniorocha@gmail.com</email>
      <uri>http://meiradarocha.jor.br</uri>
    </contributor>
    <contributor>
      <name>Mario José</name>
      <email>gnumario [at-mark] gmail [dot-mark] com</email>
    </contributor>
    <contributor>
      <name>Bernardo C. D. A. Vasconcelos</name>
      <email>bernardovasconcelos@gmail.com</email>
      <uri>https://bcdavasconcelos.github.io</uri>
    </contributor>
    <category citation-format="author-date"/>
    <category field="generic-base"/>
    <summary>The Brazilian Standard Style in accordance with ABNT-NBR 10520.2002 and ABNT-NBR 6023.2002</summary>
    <updated>2023-02-21T02:43:19+00:00</updated>
    <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
  </info>
  <locale xml:lang="pt-BR">
    <terms>
      <term name="month-01" form="short">jan.</term>
      <term name="month-02" form="short">fev.</term>
      <term name="month-03" form="short">mar.</term>
      <term name="month-04" form="short">abr.</term>
      <term name="month-05" form="short">maio</term>
      <term name="month-06" form="short">jun.</term>
      <term name="month-07" form="short">jul.</term>
      <term name="month-08" form="short">ago.</term>
      <term name="month-09" form="short">set.</term>
      <term name="month-10" form="short">out.</term>
      <term name="month-11" form="short">nov.</term>
      <term name="month-12" form="short">dez.</term>
      <term name="editor" form="short">
        <single>ed</single>
        <multiple>eds</multiple>
      </term>
      <term name="container-author" form="short">
        <single>ed</single>
        <multiple>eds</multiple>
      </term>
      <term name="collection-editor" form="short">
        <single>ed</single>
        <multiple>eds</multiple>
      </term>
    </terms>
  </locale>
  <macro name="container-contributors">
    <choose>
      <if type="chapter">
        <names variable="container-author" delimiter=", ">
          <name name-as-sort-order="all" sort-separator=", " initialize-with=". " delimiter="; " delimiter-precedes-last="always">
            <name-part name="family" text-case="uppercase"/>
            <name-part name="given" text-case="uppercase"/>
          </name>
          <label form="short" prefix=" (" suffix=".)" text-case="capitalize-first"/>
          <substitute>
            <names variable="editor"/>
            <names variable="collection-editor"/>
          </substitute>
        </names>
      </if>
    </choose>
  </macro>
  <macro name="secondary-contributors">
    <choose>
      <if type="chapter" match="none">
        <names variable="editor" delimiter="; " suffix=". ">
          <label form="short" text-case="capitalize-first" suffix=": "/>
          <name and="symbol" delimiter-precedes-last="never" et-al-min="3" et-al-use-first="2" initialize-with=". "/>
        </names>
      </if>
    </choose>
  </macro>
  <macro name="translator">
    <names variable="translator" delimiter=";  ">
      <label form="short" text-case="capitalize-first" suffix=": "/>
      <name and="symbol" delimiter-precedes-last="never" et-al-min="3" et-al-use-first="2" sort-separator=" ">
        <name-part name="given" text-case="capitalize-first"/>
        <name-part name="family" text-case="capitalize-first"/>
      </name>
    </names>
  </macro>
  <macro name="author">
    <names variable="author">
      <name delimiter="; " delimiter-precedes-last="always" initialize-with=". " name-as-sort-order="all">
        <name-part name="family" text-case="uppercase"/>
        <name-part name="given" text-case="uppercase"/>
      </name>
      <label form="short" prefix=" (" suffix=".)" text-case="uppercase"/>
      <substitute>
        <names variable="editor"/>
        <names variable="translator"/>
        <text macro="title"/>
      </substitute>
    </names>
  </macro>
  <macro name="author-short">
    <names variable="translator">
      <name form="short" delimiter="; " and="symbol" delimiter-precedes-last="never" initialize-with=". " name-as-sort-order="all">
        <name-part name="family" text-case="uppercase"/>
        <name-part name="given" text-case="uppercase"/>
      </name>
      <substitute>
        <names variable="editor"/>
        <names variable="author"/>
        <choose>
          <if type="book">
            <text variable="title" form="short"/>
          </if>
          <else>
            <text variable="title" form="short" quotes="true"/>
          </else>
        </choose>
      </substitute>
    </names>
  </macro>
  <macro name="access">
    <text variable="URL" prefix="Disponível em: &lt;" suffix="&gt;"/>
    <date variable="accessed" prefix=". Acesso em: ">
      <date-part name="day" suffix=" "/>
      <date-part name="month" form="short" suffix=". " text-case="lowercase"/>
      <date-part name="year"/>
    </date>
  </macro>
  <macro name="title">
    <choose>
      <if type="bill report" match="any">
        <text variable="title" quotes="false"/>
      </if>
      <else-if type="chapter" match="any">
        <text variable="title" quotes="true"/>
      </else-if>
      <else-if type="book thesis" match="any">
        <text variable="title" font-style="italic" font-weight="normal"/>
      </else-if>
      <else-if type="article-newspaper article-magazine article-journal" match="any">
        <text variable="title"/>
      </else-if>
      <else>
        <text variable="title" font-style="italic" font-weight="normal"/>
      </else>
    </choose>
  </macro>
  <macro name="container-title">
    <choose>
      <if type="paper-conference" match="any">
        <text variable="container-title" suffix=". "/>
        <text value="Anais" font-style="italic" font-weight="normal"/>
        <text value="..."/>
      </if>
      <else>
        <text variable="container-title" font-style="italic" font-weight="normal"/>
      </else>
    </choose>
  </macro>
  <macro name="publisher">
    <choose>
      <if match="any" variable="publisher-place publisher">
        <choose>
          <if variable="publisher-place">
            <text variable="publisher-place" suffix=": "/>
          </if>
          <else-if type="entry-encyclopedia"/>
          <else>
            <text value=""/>
          </else>
        </choose>
        <choose>
          <if variable="publisher">
            <text variable="publisher" suffix=", "/>
            <text macro="issued"/>
          </if>
          <else>
            <text value="[s.n.]"/>
          </else>
        </choose>
      </if>
      <else>
        <text value=""/>
      </else>
    </choose>
  </macro>
  <macro name="event">
    <choose>
      <if variable="event">
        <choose>
          <if variable="genre" match="none">
            <text term="in" text-case="capitalize-first" suffix=": "/>
            <text variable="event" text-case="uppercase"/>
          </if>
          <else>
            <group delimiter=" ">
              <text variable="genre" text-case="capitalize-first"/>
              <text term="presented at"/>
              <text variable="event"/>
            </group>
          </else>
        </choose>
      </if>
    </choose>
  </macro>
  <macro name="issued">
    <choose>
      <if variable="issued" match="any">
        <group>
          <choose>
            <if type="book chapter" match="none">
              <date variable="issued">
                <date-part name="day" suffix=" "/>
                <date-part name="month" form="short" suffix=" "/>
              </date>
            </if>
          </choose>
          <date variable="issued">
            <date-part name="year"/>
          </date>
        </group>
      </if>
      <else>
        <text value="[s.d.]"/>
      </else>
    </choose>
  </macro>
  <macro name="issued-year">
    <choose>
      <if variable="issued" match="any">
        <date variable="issued">
          <date-part name="year"/>
        </date>
      </if>
      <else>
        <text value="[s.d.]"/>
      </else>
    </choose>
  </macro>
  <macro name="edition">
    <choose>
      <if type="book chapter" match="any">
        <choose>
          <if is-numeric="edition">
            <group delimiter=" ">
              <number variable="edition" form="numeric" suffix="."/>
              <text term="edition" form="short" suffix="."/>
            </group>
          </if>
          <else>
            <text variable="edition" suffix=" ed."/>
          </else>
        </choose>
      </if>
    </choose>
  </macro>
  <macro name="locators">
    <choose>
      <if type="bill">
        <group prefix=". " delimiter=", ">
          <date variable="issued">
            <date-part name="day"/>
            <date-part prefix=" " name="month" form="short"/>
            <date-part prefix=" " name="year"/>
          </date>
          <text variable="section" prefix="Sec. "/>
          <text variable="page" prefix="p. " suffix="."/>
        </group>
      </if>
      <else-if match="any" type="article-journal article-magazine article-newspaper">
        <group delimiter=", ">
          <group delimiter=", ">
            <text variable="volume" prefix="v. "/>
            <text variable="issue" prefix="n. "/>
          </group>
          <text variable="page" prefix="p. "/>
        </group>
      </else-if>
      <else-if match="any" type="chapter">
        <group delimiter=", ">
          <group>
            <text variable="volume" prefix="v. "/>
            <text variable="page" prefix="p. "/>
          </group>
        </group>
      </else-if>
    </choose>
  </macro>
  <macro name="collection-title">
    <text variable="collection-title"/>
    <text variable="collection-number" prefix=" "/>
  </macro>
  <macro name="genre">
    <text variable="genre" text-case="capitalize-first"/>
  </macro>
  <macro name="citation-locator">
    <group>
      <label variable="locator" form="short"/>
      <text variable="locator" prefix=" "/>
    </group>
  </macro>
  <macro name="place">
    <choose>
      <if match="any" variable="publisher-place">
        <text variable="publisher-place"/>
      </if>
    </choose>
  </macro>
  <macro name="archive">
    <group>
      <text variable="archive" prefix=" "/>
    </group>
  </macro>
  <citation et-al-min="4" et-al-use-first="1" collapse="year" disambiguate-add-year-suffix="true">
    <sort>
      <key macro="author"/>
      <key macro="title"/>
      <key variable="issued"/>
    </sort>
    <layout delimiter="; ">
      <group>
        <choose>
          <if match="any" variable="annote" type="bill">
            <choose>
              <if match="all" variable="issued annote">
                <text variable="annote" font-style="italic"/>
              </if>
              <else-if match="any" variable="annote">
                <text variable="annote"/>
              </else-if>
              <else>
                <names variable="author">
                  <name form="short" initialize="false">
                    <name-part name="given"/>
                  </name>
                </names>
              </else>
            </choose>
          </if>
          <else-if match="any" variable="title-short">
            <choose>
              <if match="any" variable="issued">
                <text variable="title-short" font-style="italic"/>
              </if>
              <else>
                <text variable="volume-title"/>
              </else>
            </choose>
          </else-if>
          <else>
            <choose>
              <if type="chapter article" match="any">
                <names variable="translator">
                  <name form="short" delimiter="; " and="symbol">
                    <name-part name="family" text-case="uppercase" suffix=" "/>
                  </name>
                  <substitute>
                    <names variable="author">
                      <name form="short" and="symbol">
                        <name-part name="family" text-case="uppercase" suffix=" "/>
                      </name>
                    </names>
                    <names variable="editor">
                      <name form="short" and="symbol">
                        <name-part name="family" text-case="uppercase" suffix=" "/>
                      </name>
                    </names>
                  </substitute>
                </names>
              </if>
              <else>
                <text suffix=", " macro="author-short"/>
              </else>
            </choose>
            <text macro="issued-year"/>
            <text prefix=", " macro="citation-locator"/>
          </else>
        </choose>
      </group>
    </layout>
  </citation>
  <bibliography hanging-indent="false" et-al-min="4" et-al-use-first="1" entry-spacing="1">
    <sort>
      <key macro="author"/>
      <key macro="title"/>
      <key variable="issued"/>
    </sort>
    <layout>
      <choose>
        <if type="bill" match="any">
          <group>
<!--
            <names variable="author" font-style="normal" suffix=" ">
              <name font-weight="bold"/>
            </names>
 -->
             <text variable="title-short" font-weight="bold" suffix=" "/>
            <text variable="number" display="block" suffix=". "/>
            <text variable="title" font-style="italic" prefix="(" suffix=") "/>
            <text variable="note" suffix=". "/>
            <text variable="original-title" display="indent" suffix=" "/>
            <text variable="original-publisher-place" form="short"/>
            <text variable="call-number" font-weight="normal" display="indent" suffix=" "/>
            <text variable="number-of-volumes" display="indent" suffix=" "/>
            <text variable="edition" display="indent" suffix=" "/>
            <text variable="publisher-place" display="indent" suffix=" "/>
            <text variable="language"/>
            <text variable="publisher" display="indent" suffix=" "/>
            <text variable="volume" display="indent" suffix=" "/>
            <text variable="URL" display="indent" suffix=" "/>
            <text variable="DOI" display="indent" />
            <text variable="original-date" display="indent" />
            <text variable="page"  display="indent"/>
            <text variable="keyword"  display="indent" />
          </group>
        </if>
        <else-if type="map">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title" suffix=", "/>
            <text macro="issued" suffix=". "/>
            <text variable="note" suffix=". "/>
          </group>
        </else-if>
        <else-if type="book">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title" suffix=". "/>
            <text macro="secondary-contributors"/>
            <text macro="translator" suffix=". "/>
            <text macro="edition" suffix=". "/>
            <text macro="publisher" suffix=". "/>
            <text macro="locators"/>
            <text variable="note" suffix=". "/>
          </group>
        </else-if>
        <else-if type="chapter">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title" suffix=". "/>
            <text macro="secondary-contributors" suffix=". "/>
            <text term="in" text-case="capitalize-first" suffix=": "/>
            <text macro="container-contributors" suffix=". "/>
            <text macro="container-title" suffix=". "/>
            <text variable="collection-title" suffix=". "/>
            <text macro="translator" suffix=". "/>
            <text macro="edition" suffix=". "/>
            <text macro="publisher" suffix=". "/>
            <text macro="locators" suffix=". "/>
          </group>
        </else-if>
        <else-if type="article-newspaper article-magazine article-journal" match="any">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title" suffix=". "/>
            <text macro="container-title" suffix=", "/>
            <text variable="collection-title" suffix=". "/>
            <text macro="edition" suffix=", "/>
            <text macro="locators" suffix=", "/>
            <text macro="issued" suffix=". "/>
          </group>
        </else-if>
        <else-if type="thesis">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title" suffix=". "/>
            <text macro="genre" suffix=" - "/>
            <text macro="publisher" suffix="."/>
          </group>
        </else-if>
        <else-if type="manuscript">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title" suffix=". "/>
            <text macro="edition" suffix=". "/>
            <text macro="place" suffix=", "/>
            <text macro="issued" suffix=". "/>
            <text macro="access" suffix=". "/>
            <text macro="archive" suffix=". "/>
          </group>
        </else-if>
        <else-if type="webpage">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title" suffix=". "/>
            <text macro="genre" suffix=". "/>
            <text macro="access" suffix=". "/>
          </group>
        </else-if>
        <else-if type="report">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title" suffix=" "/>
            <text macro="container-contributors"/>
            <text macro="secondary-contributors"/>
            <text macro="container-title"/>
            <text variable="collection-title" prefix=": "/>
            <text macro="locators"/>
            <text macro="event"/>
            <text macro="publisher" prefix=". " suffix=". "/>
            <text macro="access" suffix="."/>
          </group>
        </else-if>
        <else-if type="entry-dictionary">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title"/>
            <text macro="container-contributors"/>
            <text macro="secondary-contributors"/>
            <text macro="container-title"/>
            <text variable="collection-title" prefix=": " suffix=". "/>
            <text macro="locators"/>
            <text macro="event"/>
            <text macro="publisher" prefix=". " suffix=". "/>
            <text macro="collection-title" prefix="(Texto para discussao, n. " suffix=")."/>
            <text macro="access"/>
          </group>
        </else-if>
        <else-if type="entry-encyclopedia">
          <group>
            <text macro="author" suffix=". "/>
            <text macro="title"/>
            <text variable="publisher-place" prefix=". " suffix=": "/>
            <text variable="publisher" suffix=", "/>
            <text macro="issued" prefix=", " suffix=". (Nota técnica)."/>
          </group>
        </else-if>
        <else-if type="paper-conference">
          <text macro="author" suffix=". "/>
          <text macro="title" suffix=". "/>
          <text macro="container-contributors"/>
          <text macro="secondary-contributors"/>
          <text macro="container-title"/>
          <text variable="collection-title" prefix=": " suffix="."/>
          <text macro="locators"/>
          <group delimiter=". " prefix=". " suffix=". ">
            <text macro="event"/>
          </group>
          <text variable="publisher-place" suffix=": "/>
          <text variable="publisher" suffix=", "/>
          <text macro="issued" suffix=". "/>
          <text macro="access"/>
        </else-if>
        <else>
          <text macro="author" suffix=". "/>
          <text macro="title" suffix=". "/>
          <text macro="container-contributors"/>
          <text macro="secondary-contributors"/>
          <text macro="container-title"/>
          <text variable="collection-title" prefix=": " suffix="."/>
          <text macro="locators"/>
          <group delimiter=". " prefix=". " suffix=". ">
            <text macro="event"/>
          </group>
          <text variable="publisher-place"/>
          <text variable="publisher" suffix=", "/>
          <text macro="issued" prefix=", " suffix=". "/>
          <text macro="access"/>
        </else>
      </choose>
    </layout>
  </bibliography>
</style>

<!-- end_file: "_extensions/csl/abnt-phi.csl" -->


<!-- begin_file: "_extensions/fontawesome/_extension.yml" -->title: Font Awesome support
author: Carlos Scheidegger
version: 1.1.0
quarto-required: ">=1.2.269"
contributes:
  shortcodes:
    - fontawesome.lua

<!-- end_file: "_extensions/fontawesome/_extension.yml" -->


<!-- begin_file: "_extensions/fontawesome/fontawesome.lua" -->local function ensureLatexDeps()
  quarto.doc.use_latex_package("fontawesome5")
end

local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = 'fontawesome6',
    version = '0.1.0',
    stylesheets = {'assets/css/all.css', 'assets/css/latex-fontsize.css'}
  })
end

local function isEmpty(s)
  return s == nil or s == ''
end

local function isValidSize(size)
  local validSizes = {
    "tiny",
    "scriptsize",
    "footnotesize",
    "small",
    "normalsize",
    "large",
    "Large",
    "LARGE",
    "huge",
    "Huge"
  }
  for _, v in ipairs(validSizes) do
    if v == size then
      return size
    end
  end
  return ""
end

return {
  ["fa"] = function(args, kwargs)

    local group = "solid"
    local icon = pandoc.utils.stringify(args[1])
    if #args > 1 then
      group = icon
      icon = pandoc.utils.stringify(args[2])
    end
    
    local title = pandoc.utils.stringify(kwargs["title"])
    if not isEmpty(title) then
      title = " title=\"" .. title  .. "\""
    end

    local label = pandoc.utils.stringify(kwargs["label"])
    if isEmpty(label) then
      label = " aria-label=\"" .. icon  .. "\""
    else
      label = " aria-label=\"" .. label  .. "\""
    end

    local size = pandoc.utils.stringify(kwargs["size"])
    
    -- detect html (excluding epub which won't handle fa)
    if quarto.doc.is_format("html:js") then
      ensureHtmlDeps()
      if not isEmpty(size) then
        size = " fa-" .. size
      end
      return pandoc.RawInline(
        'html',
        "<i class=\"fa-" .. group .. " fa-" .. icon .. size .. "\"" .. title .. label .. "></i>"
      )
    -- detect pdf / beamer / latex / etc
    elseif quarto.doc.is_format("pdf") then
      ensureLatexDeps()
      if isEmpty(isValidSize(size)) then
        return pandoc.RawInline('tex', "\\faIcon{" .. icon .. "}")
      else
        return pandoc.RawInline('tex', "{\\" .. size .. "\\faIcon{" .. icon .. "}}")
      end
    else
      return pandoc.Null()
    end
  end
}

<!-- end_file: "_extensions/fontawesome/fontawesome.lua" -->


<!-- begin_file: "_extensions/fontawesome/assets/css/all.css" -->/*!
 * Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com
 * License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License)
 * Copyright 2023 Fonticons, Inc.
 */
.fa {
  font-family: var(--fa-style-family, "Font Awesome 6 Free");
  font-weight: var(--fa-style, 900); }

.fa,
.fa-classic,
.fa-sharp,
.fas,
.fa-solid,
.far,
.fa-regular,
.fab,
.fa-brands,
.fal, 
.fa-light,
.fat,
.fa-thin,
.fad,
.fa-duotone {
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  display: var(--fa-display, inline-block);
  font-style: normal;
  font-variant: normal;
  line-height: 1;
  text-rendering: auto; }

.fas,
.fa-classic,
.fa-solid,
.far,
.fa-regular {
  font-family: 'Font Awesome 6 Free'; }

.fab,
.fa-brands {
  font-family: 'Font Awesome 6 Brands'; }

.fa-1x {
  font-size: 1em; }

.fa-2x {
  font-size: 2em; }

.fa-3x {
  font-size: 3em; }

.fa-4x {
  font-size: 4em; }

.fa-5x {
  font-size: 5em; }

.fa-6x {
  font-size: 6em; }

.fa-7x {
  font-size: 7em; }

.fa-8x {
  font-size: 8em; }

.fa-9x {
  font-size: 9em; }

.fa-10x {
  font-size: 10em; }

.fa-2xs {
  font-size: 0.625em;
  line-height: 0.1em;
  vertical-align: 0.225em; }

.fa-xs {
  font-size: 0.75em;
  line-height: 0.08333em;
  vertical-align: 0.125em; }

.fa-sm {
  font-size: 0.875em;
  line-height: 0.07143em;
  vertical-align: 0.05357em; }

.fa-lg {
  font-size: 1.25em;
  line-height: 0.05em;
  vertical-align: -0.075em; }

.fa-xl {
  font-size: 1.5em;
  line-height: 0.04167em;
  vertical-align: -0.125em; }

.fa-2xl {
  font-size: 2em;
  line-height: 0.03125em;
  vertical-align: -0.1875em; }

.fa-fw {
  text-align: center;
  width: 1.25em; }

.fa-ul {
  list-style-type: none;
  margin-left: var(--fa-li-margin, 2.5em);
  padding-left: 0; }
  .fa-ul > li {
    position: relative; }

.fa-li {
  left: calc(var(--fa-li-width, 2em) * -1);
  position: absolute;
  text-align: center;
  width: var(--fa-li-width, 2em);
  line-height: inherit; }

.fa-border {
  border-color: var(--fa-border-color, #eee);
  border-radius: var(--fa-border-radius, 0.1em);
  border-style: var(--fa-border-style, solid);
  border-width: var(--fa-border-width, 0.08em);
  padding: var(--fa-border-padding, 0.2em 0.25em 0.15em); }

.fa-pull-left {
  float: left;
  margin-right: var(--fa-pull-margin, 0.3em); }

.fa-pull-right {
  float: right;
  margin-left: var(--fa-pull-margin, 0.3em); }

.fa-beat {
  -webkit-animation-name: fa-beat;
          animation-name: fa-beat;
  -webkit-animation-delay: var(--fa-animation-delay, 0s);
          animation-delay: var(--fa-animation-delay, 0s);
  -webkit-animation-direction: var(--fa-animation-direction, normal);
          animation-direction: var(--fa-animation-direction, normal);
  -webkit-animation-duration: var(--fa-animation-duration, 1s);
          animation-duration: var(--fa-animation-duration, 1s);
  -webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
          animation-iteration-count: var(--fa-animation-iteration-count, infinite);
  -webkit-animation-timing-function: var(--fa-animation-timing, ease-in-out);
          animation-timing-function: var(--fa-animation-timing, ease-in-out); }

.fa-bounce {
  -webkit-animation-name: fa-bounce;
          animation-name: fa-bounce;
  -webkit-animation-delay: var(--fa-animation-delay, 0s);
          animation-delay: var(--fa-animation-delay, 0s);
  -webkit-animation-direction: var(--fa-animation-direction, normal);
          animation-direction: var(--fa-animation-direction, normal);
  -webkit-animation-duration: var(--fa-animation-duration, 1s);
          animation-duration: var(--fa-animation-duration, 1s);
  -webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
          animation-iteration-count: var(--fa-animation-iteration-count, infinite);
  -webkit-animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.28, 0.84, 0.42, 1));
          animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.28, 0.84, 0.42, 1)); }

.fa-fade {
  -webkit-animation-name: fa-fade;
          animation-name: fa-fade;
  -webkit-animation-delay: var(--fa-animation-delay, 0s);
          animation-delay: var(--fa-animation-delay, 0s);
  -webkit-animation-direction: var(--fa-animation-direction, normal);
          animation-direction: var(--fa-animation-direction, normal);
  -webkit-animation-duration: var(--fa-animation-duration, 1s);
          animation-duration: var(--fa-animation-duration, 1s);
  -webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
          animation-iteration-count: var(--fa-animation-iteration-count, infinite);
  -webkit-animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.4, 0, 0.6, 1));
          animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.4, 0, 0.6, 1)); }

.fa-beat-fade {
  -webkit-animation-name: fa-beat-fade;
          animation-name: fa-beat-fade;
  -webkit-animation-delay: var(--fa-animation-delay, 0s);
          animation-delay: var(--fa-animation-delay, 0s);
  -webkit-animation-direction: var(--fa-animation-direction, normal);
          animation-direction: var(--fa-animation-direction, normal);
  -webkit-animation-duration: var(--fa-animation-duration, 1s);
          animation-duration: var(--fa-animation-duration, 1s);
  -webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
          animation-iteration-count: var(--fa-animation-iteration-count, infinite);
  -webkit-animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.4, 0, 0.6, 1));
          animation-timing-function: var(--fa-animation-timing, cubic-bezier(0.4, 0, 0.6, 1)); }

.fa-flip {
  -webkit-animation-name: fa-flip;
          animation-name: fa-flip;
  -webkit-animation-delay: var(--fa-animation-delay, 0s);
          animation-delay: var(--fa-animation-delay, 0s);
  -webkit-animation-direction: var(--fa-animation-direction, normal);
          animation-direction: var(--fa-animation-direction, normal);
  -webkit-animation-duration: var(--fa-animation-duration, 1s);
          animation-duration: var(--fa-animation-duration, 1s);
  -webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
          animation-iteration-count: var(--fa-animation-iteration-count, infinite);
  -webkit-animation-timing-function: var(--fa-animation-timing, ease-in-out);
          animation-timing-function: var(--fa-animation-timing, ease-in-out); }

.fa-shake {
  -webkit-animation-name: fa-shake;
          animation-name: fa-shake;
  -webkit-animation-delay: var(--fa-animation-delay, 0s);
          animation-delay: var(--fa-animation-delay, 0s);
  -webkit-animation-direction: var(--fa-animation-direction, normal);
          animation-direction: var(--fa-animation-direction, normal);
  -webkit-animation-duration: var(--fa-animation-duration, 1s);
          animation-duration: var(--fa-animation-duration, 1s);
  -webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
          animation-iteration-count: var(--fa-animation-iteration-count, infinite);
  -webkit-animation-timing-function: var(--fa-animation-timing, linear);
          animation-timing-function: var(--fa-animation-timing, linear); }

.fa-spin {
  -webkit-animation-name: fa-spin;
          animation-name: fa-spin;
  -webkit-animation-delay: var(--fa-animation-delay, 0s);
          animation-delay: var(--fa-animation-delay, 0s);
  -webkit-animation-direction: var(--fa-animation-direction, normal);
          animation-direction: var(--fa-animation-direction, normal);
  -webkit-animation-duration: var(--fa-animation-duration, 2s);
          animation-duration: var(--fa-animation-duration, 2s);
  -webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
          animation-iteration-count: var(--fa-animation-iteration-count, infinite);
  -webkit-animation-timing-function: var(--fa-animation-timing, linear);
          animation-timing-function: var(--fa-animation-timing, linear); }

.fa-spin-reverse {
  --fa-animation-direction: reverse; }

.fa-pulse,
.fa-spin-pulse {
  -webkit-animation-name: fa-spin;
          animation-name: fa-spin;
  -webkit-animation-direction: var(--fa-animation-direction, normal);
          animation-direction: var(--fa-animation-direction, normal);
  -webkit-animation-duration: var(--fa-animation-duration, 1s);
          animation-duration: var(--fa-animation-duration, 1s);
  -webkit-animation-iteration-count: var(--fa-animation-iteration-count, infinite);
          animation-iteration-count: var(--fa-animation-iteration-count, infinite);
  -webkit-animation-timing-function: var(--fa-animation-timing, steps(8));
          animation-timing-function: var(--fa-animation-timing, steps(8)); }

@media (prefers-reduced-motion: reduce) {
  .fa-beat,
  .fa-bounce,
  .fa-fade,
  .fa-beat-fade,
  .fa-flip,
  .fa-pulse,
  .fa-shake,
  .fa-spin,
  .fa-spin-pulse {
    -webkit-animation-delay: -1ms;
            animation-delay: -1ms;
    -webkit-animation-duration: 1ms;
            animation-duration: 1ms;
    -webkit-animation-iteration-count: 1;
            animation-iteration-count: 1;
    -webkit-transition-delay: 0s;
            transition-delay: 0s;
    -webkit-transition-duration: 0s;
            transition-duration: 0s; } }

@-webkit-keyframes fa-beat {
  0%, 90% {
    -webkit-transform: scale(1);
            transform: scale(1); }
  45% {
    -webkit-transform: scale(var(--fa-beat-scale, 1.25));
            transform: scale(var(--fa-beat-scale, 1.25)); } }

@keyframes fa-beat {
  0%, 90% {
    -webkit-transform: scale(1);
            transform: scale(1); }
  45% {
    -webkit-transform: scale(var(--fa-beat-scale, 1.25));
            transform: scale(var(--fa-beat-scale, 1.25)); } }

@-webkit-keyframes fa-bounce {
  0% {
    -webkit-transform: scale(1, 1) translateY(0);
            transform: scale(1, 1) translateY(0); }
  10% {
    -webkit-transform: scale(var(--fa-bounce-start-scale-x, 1.1), var(--fa-bounce-start-scale-y, 0.9)) translateY(0);
            transform: scale(var(--fa-bounce-start-scale-x, 1.1), var(--fa-bounce-start-scale-y, 0.9)) translateY(0); }
  30% {
    -webkit-transform: scale(var(--fa-bounce-jump-scale-x, 0.9), var(--fa-bounce-jump-scale-y, 1.1)) translateY(var(--fa-bounce-height, -0.5em));
            transform: scale(var(--fa-bounce-jump-scale-x, 0.9), var(--fa-bounce-jump-scale-y, 1.1)) translateY(var(--fa-bounce-height, -0.5em)); }
  50% {
    -webkit-transform: scale(var(--fa-bounce-land-scale-x, 1.05), var(--fa-bounce-land-scale-y, 0.95)) translateY(0);
            transform: scale(var(--fa-bounce-land-scale-x, 1.05), var(--fa-bounce-land-scale-y, 0.95)) translateY(0); }
  57% {
    -webkit-transform: scale(1, 1) translateY(var(--fa-bounce-rebound, -0.125em));
            transform: scale(1, 1) translateY(var(--fa-bounce-rebound, -0.125em)); }
  64% {
    -webkit-transform: scale(1, 1) translateY(0);
            transform: scale(1, 1) translateY(0); }
  100% {
    -webkit-transform: scale(1, 1) translateY(0);
            transform: scale(1, 1) translateY(0); } }

@keyframes fa-bounce {
  0% {
    -webkit-transform: scale(1, 1) translateY(0);
            transform: scale(1, 1) translateY(0); }
  10% {
    -webkit-transform: scale(var(--fa-bounce-start-scale-x, 1.1), var(--fa-bounce-start-scale-y, 0.9)) translateY(0);
            transform: scale(var(--fa-bounce-start-scale-x, 1.1), var(--fa-bounce-start-scale-y, 0.9)) translateY(0); }
  30% {
    -webkit-transform: scale(var(--fa-bounce-jump-scale-x, 0.9), var(--fa-bounce-jump-scale-y, 1.1)) translateY(var(--fa-bounce-height, -0.5em));
            transform: scale(var(--fa-bounce-jump-scale-x, 0.9), var(--fa-bounce-jump-scale-y, 1.1)) translateY(var(--fa-bounce-height, -0.5em)); }
  50% {
    -webkit-transform: scale(var(--fa-bounce-land-scale-x, 1.05), var(--fa-bounce-land-scale-y, 0.95)) translateY(0);
            transform: scale(var(--fa-bounce-land-scale-x, 1.05), var(--fa-bounce-land-scale-y, 0.95)) translateY(0); }
  57% {
    -webkit-transform: scale(1, 1) translateY(var(--fa-bounce-rebound, -0.125em));
            transform: scale(1, 1) translateY(var(--fa-bounce-rebound, -0.125em)); }
  64% {
    -webkit-transform: scale(1, 1) translateY(0);
            transform: scale(1, 1) translateY(0); }
  100% {
    -webkit-transform: scale(1, 1) translateY(0);
            transform: scale(1, 1) translateY(0); } }

@-webkit-keyframes fa-fade {
  50% {
    opacity: var(--fa-fade-opacity, 0.4); } }

@keyframes fa-fade {
  50% {
    opacity: var(--fa-fade-opacity, 0.4); } }

@-webkit-keyframes fa-beat-fade {
  0%, 100% {
    opacity: var(--fa-beat-fade-opacity, 0.4);
    -webkit-transform: scale(1);
            transform: scale(1); }
  50% {
    opacity: 1;
    -webkit-transform: scale(var(--fa-beat-fade-scale, 1.125));
            transform: scale(var(--fa-beat-fade-scale, 1.125)); } }

@keyframes fa-beat-fade {
  0%, 100% {
    opacity: var(--fa-beat-fade-opacity, 0.4);
    -webkit-transform: scale(1);
            transform: scale(1); }
  50% {
    opacity: 1;
    -webkit-transform: scale(var(--fa-beat-fade-scale, 1.125));
            transform: scale(var(--fa-beat-fade-scale, 1.125)); } }

@-webkit-keyframes fa-flip {
  50% {
    -webkit-transform: rotate3d(var(--fa-flip-x, 0), var(--fa-flip-y, 1), var(--fa-flip-z, 0), var(--fa-flip-angle, -180deg));
            transform: rotate3d(var(--fa-flip-x, 0), var(--fa-flip-y, 1), var(--fa-flip-z, 0), var(--fa-flip-angle, -180deg)); } }

@keyframes fa-flip {
  50% {
    -webkit-transform: rotate3d(var(--fa-flip-x, 0), var(--fa-flip-y, 1), var(--fa-flip-z, 0), var(--fa-flip-angle, -180deg));
            transform: rotate3d(var(--fa-flip-x, 0), var(--fa-flip-y, 1), var(--fa-flip-z, 0), var(--fa-flip-angle, -180deg)); } }

@-webkit-keyframes fa-shake {
  0% {
    -webkit-transform: rotate(-15deg);
            transform: rotate(-15deg); }
  4% {
    -webkit-transform: rotate(15deg);
            transform: rotate(15deg); }
  8%, 24% {
    -webkit-transform: rotate(-18deg);
            transform: rotate(-18deg); }
  12%, 28% {
    -webkit-transform: rotate(18deg);
            transform: rotate(18deg); }
  16% {
    -webkit-transform: rotate(-22deg);
            transform: rotate(-22deg); }
  20% {
    -webkit-transform: rotate(22deg);
            transform: rotate(22deg); }
  32% {
    -webkit-transform: rotate(-12deg);
            transform: rotate(-12deg); }
  36% {
    -webkit-transform: rotate(12deg);
            transform: rotate(12deg); }
  40%, 100% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg); } }

@keyframes fa-shake {
  0% {
    -webkit-transform: rotate(-15deg);
            transform: rotate(-15deg); }
  4% {
    -webkit-transform: rotate(15deg);
            transform: rotate(15deg); }
  8%, 24% {
    -webkit-transform: rotate(-18deg);
            transform: rotate(-18deg); }
  12%, 28% {
    -webkit-transform: rotate(18deg);
            transform: rotate(18deg); }
  16% {
    -webkit-transform: rotate(-22deg);
            transform: rotate(-22deg); }
  20% {
    -webkit-transform: rotate(22deg);
            transform: rotate(22deg); }
  32% {
    -webkit-transform: rotate(-12deg);
            transform: rotate(-12deg); }
  36% {
    -webkit-transform: rotate(12deg);
            transform: rotate(12deg); }
  40%, 100% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg); } }

@-webkit-keyframes fa-spin {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg); }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg); } }

@keyframes fa-spin {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg); }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg); } }

.fa-rotate-90 {
  -webkit-transform: rotate(90deg);
          transform: rotate(90deg); }

.fa-rotate-180 {
  -webkit-transform: rotate(180deg);
          transform: rotate(180deg); }

.fa-rotate-270 {
  -webkit-transform: rotate(270deg);
          transform: rotate(270deg); }

.fa-flip-horizontal {
  -webkit-transform: scale(-1, 1);
          transform: scale(-1, 1); }

.fa-flip-vertical {
  -webkit-transform: scale(1, -1);
          transform: scale(1, -1); }

.fa-flip-both,
.fa-flip-horizontal.fa-flip-vertical {
  -webkit-transform: scale(-1, -1);
          transform: scale(-1, -1); }

.fa-rotate-by {
  -webkit-transform: rotate(var(--fa-rotate-angle, none));
          transform: rotate(var(--fa-rotate-angle, none)); }

.fa-stack {
  display: inline-block;
  height: 2em;
  line-height: 2em;
  position: relative;
  vertical-align: middle;
  width: 2.5em; }

.fa-stack-1x,
.fa-stack-2x {
  left: 0;
  position: absolute;
  text-align: center;
  width: 100%;
  z-index: var(--fa-stack-z-index, auto); }

.fa-stack-1x {
  line-height: inherit; }

.fa-stack-2x {
  font-size: 2em; }

.fa-inverse {
  color: var(--fa-inverse, #fff); }

/* Font Awesome uses the Unicode Private Use Area (PUA) to ensure screen
readers do not read off random characters that represent icons */

.fa-0::before {
  content: "\30"; }

.fa-1::before {
  content: "\31"; }

.fa-2::before {
  content: "\32"; }

.fa-3::before {
  content: "\33"; }

.fa-4::before {
  content: "\34"; }

.fa-5::before {
  content: "\35"; }

.fa-6::before {
  content: "\36"; }

.fa-7::before {
  content: "\37"; }

.fa-8::before {
  content: "\38"; }

.fa-9::before {
  content: "\39"; }

.fa-fill-drip::before {
  content: "\f576"; }

.fa-arrows-to-circle::before {
  content: "\e4bd"; }

.fa-circle-chevron-right::before {
  content: "\f138"; }

.fa-chevron-circle-right::before {
  content: "\f138"; }

.fa-at::before {
  content: "\40"; }

.fa-trash-can::before {
  content: "\f2ed"; }

.fa-trash-alt::before {
  content: "\f2ed"; }

.fa-text-height::before {
  content: "\f034"; }

.fa-user-xmark::before {
  content: "\f235"; }

.fa-user-times::before {
  content: "\f235"; }

.fa-stethoscope::before {
  content: "\f0f1"; }

.fa-message::before {
  content: "\f27a"; }

.fa-comment-alt::before {
  content: "\f27a"; }

.fa-info::before {
  content: "\f129"; }

.fa-down-left-and-up-right-to-center::before {
  content: "\f422"; }

.fa-compress-alt::before {
  content: "\f422"; }

.fa-explosion::before {
  content: "\e4e9"; }

.fa-file-lines::before {
  content: "\f15c"; }

.fa-file-alt::before {
  content: "\f15c"; }

.fa-file-text::before {
  content: "\f15c"; }

.fa-wave-square::before {
  content: "\f83e"; }

.fa-ring::before {
  content: "\f70b"; }

.fa-building-un::before {
  content: "\e4d9"; }

.fa-dice-three::before {
  content: "\f527"; }

.fa-calendar-days::before {
  content: "\f073"; }

.fa-calendar-alt::before {
  content: "\f073"; }

.fa-anchor-circle-check::before {
  content: "\e4aa"; }

.fa-building-circle-arrow-right::before {
  content: "\e4d1"; }

.fa-volleyball::before {
  content: "\f45f"; }

.fa-volleyball-ball::before {
  content: "\f45f"; }

.fa-arrows-up-to-line::before {
  content: "\e4c2"; }

.fa-sort-down::before {
  content: "\f0dd"; }

.fa-sort-desc::before {
  content: "\f0dd"; }

.fa-circle-minus::before {
  content: "\f056"; }

.fa-minus-circle::before {
  content: "\f056"; }

.fa-door-open::before {
  content: "\f52b"; }

.fa-right-from-bracket::before {
  content: "\f2f5"; }

.fa-sign-out-alt::before {
  content: "\f2f5"; }

.fa-atom::before {
  content: "\f5d2"; }

.fa-soap::before {
  content: "\e06e"; }

.fa-icons::before {
  content: "\f86d"; }

.fa-heart-music-camera-bolt::before {
  content: "\f86d"; }

.fa-microphone-lines-slash::before {
  content: "\f539"; }

.fa-microphone-alt-slash::before {
  content: "\f539"; }

.fa-bridge-circle-check::before {
  content: "\e4c9"; }

.fa-pump-medical::before {
  content: "\e06a"; }

.fa-fingerprint::before {
  content: "\f577"; }

.fa-hand-point-right::before {
  content: "\f0a4"; }

.fa-magnifying-glass-location::before {
  content: "\f689"; }

.fa-search-location::before {
  content: "\f689"; }

.fa-forward-step::before {
  content: "\f051"; }

.fa-step-forward::before {
  content: "\f051"; }

.fa-face-smile-beam::before {
  content: "\f5b8"; }

.fa-smile-beam::before {
  content: "\f5b8"; }

.fa-flag-checkered::before {
  content: "\f11e"; }

.fa-football::before {
  content: "\f44e"; }

.fa-football-ball::before {
  content: "\f44e"; }

.fa-school-circle-exclamation::before {
  content: "\e56c"; }

.fa-crop::before {
  content: "\f125"; }

.fa-angles-down::before {
  content: "\f103"; }

.fa-angle-double-down::before {
  content: "\f103"; }

.fa-users-rectangle::before {
  content: "\e594"; }

.fa-people-roof::before {
  content: "\e537"; }

.fa-people-line::before {
  content: "\e534"; }

.fa-beer-mug-empty::before {
  content: "\f0fc"; }

.fa-beer::before {
  content: "\f0fc"; }

.fa-diagram-predecessor::before {
  content: "\e477"; }

.fa-arrow-up-long::before {
  content: "\f176"; }

.fa-long-arrow-up::before {
  content: "\f176"; }

.fa-fire-flame-simple::before {
  content: "\f46a"; }

.fa-burn::before {
  content: "\f46a"; }

.fa-person::before {
  content: "\f183"; }

.fa-male::before {
  content: "\f183"; }

.fa-laptop::before {
  content: "\f109"; }

.fa-file-csv::before {
  content: "\f6dd"; }

.fa-menorah::before {
  content: "\f676"; }

.fa-truck-plane::before {
  content: "\e58f"; }

.fa-record-vinyl::before {
  content: "\f8d9"; }

.fa-face-grin-stars::before {
  content: "\f587"; }

.fa-grin-stars::before {
  content: "\f587"; }

.fa-bong::before {
  content: "\f55c"; }

.fa-spaghetti-monster-flying::before {
  content: "\f67b"; }

.fa-pastafarianism::before {
  content: "\f67b"; }

.fa-arrow-down-up-across-line::before {
  content: "\e4af"; }

.fa-spoon::before {
  content: "\f2e5"; }

.fa-utensil-spoon::before {
  content: "\f2e5"; }

.fa-jar-wheat::before {
  content: "\e517"; }

.fa-envelopes-bulk::before {
  content: "\f674"; }

.fa-mail-bulk::before {
  content: "\f674"; }

.fa-file-circle-exclamation::before {
  content: "\e4eb"; }

.fa-circle-h::before {
  content: "\f47e"; }

.fa-hospital-symbol::before {
  content: "\f47e"; }

.fa-pager::before {
  content: "\f815"; }

.fa-address-book::before {
  content: "\f2b9"; }

.fa-contact-book::before {
  content: "\f2b9"; }

.fa-strikethrough::before {
  content: "\f0cc"; }

.fa-k::before {
  content: "\4b"; }

.fa-landmark-flag::before {
  content: "\e51c"; }

.fa-pencil::before {
  content: "\f303"; }

.fa-pencil-alt::before {
  content: "\f303"; }

.fa-backward::before {
  content: "\f04a"; }

.fa-caret-right::before {
  content: "\f0da"; }

.fa-comments::before {
  content: "\f086"; }

.fa-paste::before {
  content: "\f0ea"; }

.fa-file-clipboard::before {
  content: "\f0ea"; }

.fa-code-pull-request::before {
  content: "\e13c"; }

.fa-clipboard-list::before {
  content: "\f46d"; }

.fa-truck-ramp-box::before {
  content: "\f4de"; }

.fa-truck-loading::before {
  content: "\f4de"; }

.fa-user-check::before {
  content: "\f4fc"; }

.fa-vial-virus::before {
  content: "\e597"; }

.fa-sheet-plastic::before {
  content: "\e571"; }

.fa-blog::before {
  content: "\f781"; }

.fa-user-ninja::before {
  content: "\f504"; }

.fa-person-arrow-up-from-line::before {
  content: "\e539"; }

.fa-scroll-torah::before {
  content: "\f6a0"; }

.fa-torah::before {
  content: "\f6a0"; }

.fa-broom-ball::before {
  content: "\f458"; }

.fa-quidditch::before {
  content: "\f458"; }

.fa-quidditch-broom-ball::before {
  content: "\f458"; }

.fa-toggle-off::before {
  content: "\f204"; }

.fa-box-archive::before {
  content: "\f187"; }

.fa-archive::before {
  content: "\f187"; }

.fa-person-drowning::before {
  content: "\e545"; }

.fa-arrow-down-9-1::before {
  content: "\f886"; }

.fa-sort-numeric-desc::before {
  content: "\f886"; }

.fa-sort-numeric-down-alt::before {
  content: "\f886"; }

.fa-face-grin-tongue-squint::before {
  content: "\f58a"; }

.fa-grin-tongue-squint::before {
  content: "\f58a"; }

.fa-spray-can::before {
  content: "\f5bd"; }

.fa-truck-monster::before {
  content: "\f63b"; }

.fa-w::before {
  content: "\57"; }

.fa-earth-africa::before {
  content: "\f57c"; }

.fa-globe-africa::before {
  content: "\f57c"; }

.fa-rainbow::before {
  content: "\f75b"; }

.fa-circle-notch::before {
  content: "\f1ce"; }

.fa-tablet-screen-button::before {
  content: "\f3fa"; }

.fa-tablet-alt::before {
  content: "\f3fa"; }

.fa-paw::before {
  content: "\f1b0"; }

.fa-cloud::before {
  content: "\f0c2"; }

.fa-trowel-bricks::before {
  content: "\e58a"; }

.fa-face-flushed::before {
  content: "\f579"; }

.fa-flushed::before {
  content: "\f579"; }

.fa-hospital-user::before {
  content: "\f80d"; }

.fa-tent-arrow-left-right::before {
  content: "\e57f"; }

.fa-gavel::before {
  content: "\f0e3"; }

.fa-legal::before {
  content: "\f0e3"; }

.fa-binoculars::before {
  content: "\f1e5"; }

.fa-microphone-slash::before {
  content: "\f131"; }

.fa-box-tissue::before {
  content: "\e05b"; }

.fa-motorcycle::before {
  content: "\f21c"; }

.fa-bell-concierge::before {
  content: "\f562"; }

.fa-concierge-bell::before {
  content: "\f562"; }

.fa-pen-ruler::before {
  content: "\f5ae"; }

.fa-pencil-ruler::before {
  content: "\f5ae"; }

.fa-people-arrows::before {
  content: "\e068"; }

.fa-people-arrows-left-right::before {
  content: "\e068"; }

.fa-mars-and-venus-burst::before {
  content: "\e523"; }

.fa-square-caret-right::before {
  content: "\f152"; }

.fa-caret-square-right::before {
  content: "\f152"; }

.fa-scissors::before {
  content: "\f0c4"; }

.fa-cut::before {
  content: "\f0c4"; }

.fa-sun-plant-wilt::before {
  content: "\e57a"; }

.fa-toilets-portable::before {
  content: "\e584"; }

.fa-hockey-puck::before {
  content: "\f453"; }

.fa-table::before {
  content: "\f0ce"; }

.fa-magnifying-glass-arrow-right::before {
  content: "\e521"; }

.fa-tachograph-digital::before {
  content: "\f566"; }

.fa-digital-tachograph::before {
  content: "\f566"; }

.fa-users-slash::before {
  content: "\e073"; }

.fa-clover::before {
  content: "\e139"; }

.fa-reply::before {
  content: "\f3e5"; }

.fa-mail-reply::before {
  content: "\f3e5"; }

.fa-star-and-crescent::before {
  content: "\f699"; }

.fa-house-fire::before {
  content: "\e50c"; }

.fa-square-minus::before {
  content: "\f146"; }

.fa-minus-square::before {
  content: "\f146"; }

.fa-helicopter::before {
  content: "\f533"; }

.fa-compass::before {
  content: "\f14e"; }

.fa-square-caret-down::before {
  content: "\f150"; }

.fa-caret-square-down::before {
  content: "\f150"; }

.fa-file-circle-question::before {
  content: "\e4ef"; }

.fa-laptop-code::before {
  content: "\f5fc"; }

.fa-swatchbook::before {
  content: "\f5c3"; }

.fa-prescription-bottle::before {
  content: "\f485"; }

.fa-bars::before {
  content: "\f0c9"; }

.fa-navicon::before {
  content: "\f0c9"; }

.fa-people-group::before {
  content: "\e533"; }

.fa-hourglass-end::before {
  content: "\f253"; }

.fa-hourglass-3::before {
  content: "\f253"; }

.fa-heart-crack::before {
  content: "\f7a9"; }

.fa-heart-broken::before {
  content: "\f7a9"; }

.fa-square-up-right::before {
  content: "\f360"; }

.fa-external-link-square-alt::before {
  content: "\f360"; }

.fa-face-kiss-beam::before {
  content: "\f597"; }

.fa-kiss-beam::before {
  content: "\f597"; }

.fa-film::before {
  content: "\f008"; }

.fa-ruler-horizontal::before {
  content: "\f547"; }

.fa-people-robbery::before {
  content: "\e536"; }

.fa-lightbulb::before {
  content: "\f0eb"; }

.fa-caret-left::before {
  content: "\f0d9"; }

.fa-circle-exclamation::before {
  content: "\f06a"; }

.fa-exclamation-circle::before {
  content: "\f06a"; }

.fa-school-circle-xmark::before {
  content: "\e56d"; }

.fa-arrow-right-from-bracket::before {
  content: "\f08b"; }

.fa-sign-out::before {
  content: "\f08b"; }

.fa-circle-chevron-down::before {
  content: "\f13a"; }

.fa-chevron-circle-down::before {
  content: "\f13a"; }

.fa-unlock-keyhole::before {
  content: "\f13e"; }

.fa-unlock-alt::before {
  content: "\f13e"; }

.fa-cloud-showers-heavy::before {
  content: "\f740"; }

.fa-headphones-simple::before {
  content: "\f58f"; }

.fa-headphones-alt::before {
  content: "\f58f"; }

.fa-sitemap::before {
  content: "\f0e8"; }

.fa-circle-dollar-to-slot::before {
  content: "\f4b9"; }

.fa-donate::before {
  content: "\f4b9"; }

.fa-memory::before {
  content: "\f538"; }

.fa-road-spikes::before {
  content: "\e568"; }

.fa-fire-burner::before {
  content: "\e4f1"; }

.fa-flag::before {
  content: "\f024"; }

.fa-hanukiah::before {
  content: "\f6e6"; }

.fa-feather::before {
  content: "\f52d"; }

.fa-volume-low::before {
  content: "\f027"; }

.fa-volume-down::before {
  content: "\f027"; }

.fa-comment-slash::before {
  content: "\f4b3"; }

.fa-cloud-sun-rain::before {
  content: "\f743"; }

.fa-compress::before {
  content: "\f066"; }

.fa-wheat-awn::before {
  content: "\e2cd"; }

.fa-wheat-alt::before {
  content: "\e2cd"; }

.fa-ankh::before {
  content: "\f644"; }

.fa-hands-holding-child::before {
  content: "\e4fa"; }

.fa-asterisk::before {
  content: "\2a"; }

.fa-square-check::before {
  content: "\f14a"; }

.fa-check-square::before {
  content: "\f14a"; }

.fa-peseta-sign::before {
  content: "\e221"; }

.fa-heading::before {
  content: "\f1dc"; }

.fa-header::before {
  content: "\f1dc"; }

.fa-ghost::before {
  content: "\f6e2"; }

.fa-list::before {
  content: "\f03a"; }

.fa-list-squares::before {
  content: "\f03a"; }

.fa-square-phone-flip::before {
  content: "\f87b"; }

.fa-phone-square-alt::before {
  content: "\f87b"; }

.fa-cart-plus::before {
  content: "\f217"; }

.fa-gamepad::before {
  content: "\f11b"; }

.fa-circle-dot::before {
  content: "\f192"; }

.fa-dot-circle::before {
  content: "\f192"; }

.fa-face-dizzy::before {
  content: "\f567"; }

.fa-dizzy::before {
  content: "\f567"; }

.fa-egg::before {
  content: "\f7fb"; }

.fa-house-medical-circle-xmark::before {
  content: "\e513"; }

.fa-campground::before {
  content: "\f6bb"; }

.fa-folder-plus::before {
  content: "\f65e"; }

.fa-futbol::before {
  content: "\f1e3"; }

.fa-futbol-ball::before {
  content: "\f1e3"; }

.fa-soccer-ball::before {
  content: "\f1e3"; }

.fa-paintbrush::before {
  content: "\f1fc"; }

.fa-paint-brush::before {
  content: "\f1fc"; }

.fa-lock::before {
  content: "\f023"; }

.fa-gas-pump::before {
  content: "\f52f"; }

.fa-hot-tub-person::before {
  content: "\f593"; }

.fa-hot-tub::before {
  content: "\f593"; }

.fa-map-location::before {
  content: "\f59f"; }

.fa-map-marked::before {
  content: "\f59f"; }

.fa-house-flood-water::before {
  content: "\e50e"; }

.fa-tree::before {
  content: "\f1bb"; }

.fa-bridge-lock::before {
  content: "\e4cc"; }

.fa-sack-dollar::before {
  content: "\f81d"; }

.fa-pen-to-square::before {
  content: "\f044"; }

.fa-edit::before {
  content: "\f044"; }

.fa-car-side::before {
  content: "\f5e4"; }

.fa-share-nodes::before {
  content: "\f1e0"; }

.fa-share-alt::before {
  content: "\f1e0"; }

.fa-heart-circle-minus::before {
  content: "\e4ff"; }

.fa-hourglass-half::before {
  content: "\f252"; }

.fa-hourglass-2::before {
  content: "\f252"; }

.fa-microscope::before {
  content: "\f610"; }

.fa-sink::before {
  content: "\e06d"; }

.fa-bag-shopping::before {
  content: "\f290"; }

.fa-shopping-bag::before {
  content: "\f290"; }

.fa-arrow-down-z-a::before {
  content: "\f881"; }

.fa-sort-alpha-desc::before {
  content: "\f881"; }

.fa-sort-alpha-down-alt::before {
  content: "\f881"; }

.fa-mitten::before {
  content: "\f7b5"; }

.fa-person-rays::before {
  content: "\e54d"; }

.fa-users::before {
  content: "\f0c0"; }

.fa-eye-slash::before {
  content: "\f070"; }

.fa-flask-vial::before {
  content: "\e4f3"; }

.fa-hand::before {
  content: "\f256"; }

.fa-hand-paper::before {
  content: "\f256"; }

.fa-om::before {
  content: "\f679"; }

.fa-worm::before {
  content: "\e599"; }

.fa-house-circle-xmark::before {
  content: "\e50b"; }

.fa-plug::before {
  content: "\f1e6"; }

.fa-chevron-up::before {
  content: "\f077"; }

.fa-hand-spock::before {
  content: "\f259"; }

.fa-stopwatch::before {
  content: "\f2f2"; }

.fa-face-kiss::before {
  content: "\f596"; }

.fa-kiss::before {
  content: "\f596"; }

.fa-bridge-circle-xmark::before {
  content: "\e4cb"; }

.fa-face-grin-tongue::before {
  content: "\f589"; }

.fa-grin-tongue::before {
  content: "\f589"; }

.fa-chess-bishop::before {
  content: "\f43a"; }

.fa-face-grin-wink::before {
  content: "\f58c"; }

.fa-grin-wink::before {
  content: "\f58c"; }

.fa-ear-deaf::before {
  content: "\f2a4"; }

.fa-deaf::before {
  content: "\f2a4"; }

.fa-deafness::before {
  content: "\f2a4"; }

.fa-hard-of-hearing::before {
  content: "\f2a4"; }

.fa-road-circle-check::before {
  content: "\e564"; }

.fa-dice-five::before {
  content: "\f523"; }

.fa-square-rss::before {
  content: "\f143"; }

.fa-rss-square::before {
  content: "\f143"; }

.fa-land-mine-on::before {
  content: "\e51b"; }

.fa-i-cursor::before {
  content: "\f246"; }

.fa-stamp::before {
  content: "\f5bf"; }

.fa-stairs::before {
  content: "\e289"; }

.fa-i::before {
  content: "\49"; }

.fa-hryvnia-sign::before {
  content: "\f6f2"; }

.fa-hryvnia::before {
  content: "\f6f2"; }

.fa-pills::before {
  content: "\f484"; }

.fa-face-grin-wide::before {
  content: "\f581"; }

.fa-grin-alt::before {
  content: "\f581"; }

.fa-tooth::before {
  content: "\f5c9"; }

.fa-v::before {
  content: "\56"; }

.fa-bangladeshi-taka-sign::before {
  content: "\e2e6"; }

.fa-bicycle::before {
  content: "\f206"; }

.fa-staff-snake::before {
  content: "\e579"; }

.fa-rod-asclepius::before {
  content: "\e579"; }

.fa-rod-snake::before {
  content: "\e579"; }

.fa-staff-aesculapius::before {
  content: "\e579"; }

.fa-head-side-cough-slash::before {
  content: "\e062"; }

.fa-truck-medical::before {
  content: "\f0f9"; }

.fa-ambulance::before {
  content: "\f0f9"; }

.fa-wheat-awn-circle-exclamation::before {
  content: "\e598"; }

.fa-snowman::before {
  content: "\f7d0"; }

.fa-mortar-pestle::before {
  content: "\f5a7"; }

.fa-road-barrier::before {
  content: "\e562"; }

.fa-school::before {
  content: "\f549"; }

.fa-igloo::before {
  content: "\f7ae"; }

.fa-joint::before {
  content: "\f595"; }

.fa-angle-right::before {
  content: "\f105"; }

.fa-horse::before {
  content: "\f6f0"; }

.fa-q::before {
  content: "\51"; }

.fa-g::before {
  content: "\47"; }

.fa-notes-medical::before {
  content: "\f481"; }

.fa-temperature-half::before {
  content: "\f2c9"; }

.fa-temperature-2::before {
  content: "\f2c9"; }

.fa-thermometer-2::before {
  content: "\f2c9"; }

.fa-thermometer-half::before {
  content: "\f2c9"; }

.fa-dong-sign::before {
  content: "\e169"; }

.fa-capsules::before {
  content: "\f46b"; }

.fa-poo-storm::before {
  content: "\f75a"; }

.fa-poo-bolt::before {
  content: "\f75a"; }

.fa-face-frown-open::before {
  content: "\f57a"; }

.fa-frown-open::before {
  content: "\f57a"; }

.fa-hand-point-up::before {
  content: "\f0a6"; }

.fa-money-bill::before {
  content: "\f0d6"; }

.fa-bookmark::before {
  content: "\f02e"; }

.fa-align-justify::before {
  content: "\f039"; }

.fa-umbrella-beach::before {
  content: "\f5ca"; }

.fa-helmet-un::before {
  content: "\e503"; }

.fa-bullseye::before {
  content: "\f140"; }

.fa-bacon::before {
  content: "\f7e5"; }

.fa-hand-point-down::before {
  content: "\f0a7"; }

.fa-arrow-up-from-bracket::before {
  content: "\e09a"; }

.fa-folder::before {
  content: "\f07b"; }

.fa-folder-blank::before {
  content: "\f07b"; }

.fa-file-waveform::before {
  content: "\f478"; }

.fa-file-medical-alt::before {
  content: "\f478"; }

.fa-radiation::before {
  content: "\f7b9"; }

.fa-chart-simple::before {
  content: "\e473"; }

.fa-mars-stroke::before {
  content: "\f229"; }

.fa-vial::before {
  content: "\f492"; }

.fa-gauge::before {
  content: "\f624"; }

.fa-dashboard::before {
  content: "\f624"; }

.fa-gauge-med::before {
  content: "\f624"; }

.fa-tachometer-alt-average::before {
  content: "\f624"; }

.fa-wand-magic-sparkles::before {
  content: "\e2ca"; }

.fa-magic-wand-sparkles::before {
  content: "\e2ca"; }

.fa-e::before {
  content: "\45"; }

.fa-pen-clip::before {
  content: "\f305"; }

.fa-pen-alt::before {
  content: "\f305"; }

.fa-bridge-circle-exclamation::before {
  content: "\e4ca"; }

.fa-user::before {
  content: "\f007"; }

.fa-school-circle-check::before {
  content: "\e56b"; }

.fa-dumpster::before {
  content: "\f793"; }

.fa-van-shuttle::before {
  content: "\f5b6"; }

.fa-shuttle-van::before {
  content: "\f5b6"; }

.fa-building-user::before {
  content: "\e4da"; }

.fa-square-caret-left::before {
  content: "\f191"; }

.fa-caret-square-left::before {
  content: "\f191"; }

.fa-highlighter::before {
  content: "\f591"; }

.fa-key::before {
  content: "\f084"; }

.fa-bullhorn::before {
  content: "\f0a1"; }

.fa-globe::before {
  content: "\f0ac"; }

.fa-synagogue::before {
  content: "\f69b"; }

.fa-person-half-dress::before {
  content: "\e548"; }

.fa-road-bridge::before {
  content: "\e563"; }

.fa-location-arrow::before {
  content: "\f124"; }

.fa-c::before {
  content: "\43"; }

.fa-tablet-button::before {
  content: "\f10a"; }

.fa-building-lock::before {
  content: "\e4d6"; }

.fa-pizza-slice::before {
  content: "\f818"; }

.fa-money-bill-wave::before {
  content: "\f53a"; }

.fa-chart-area::before {
  content: "\f1fe"; }

.fa-area-chart::before {
  content: "\f1fe"; }

.fa-house-flag::before {
  content: "\e50d"; }

.fa-person-circle-minus::before {
  content: "\e540"; }

.fa-ban::before {
  content: "\f05e"; }

.fa-cancel::before {
  content: "\f05e"; }

.fa-camera-rotate::before {
  content: "\e0d8"; }

.fa-spray-can-sparkles::before {
  content: "\f5d0"; }

.fa-air-freshener::before {
  content: "\f5d0"; }

.fa-star::before {
  content: "\f005"; }

.fa-repeat::before {
  content: "\f363"; }

.fa-cross::before {
  content: "\f654"; }

.fa-box::before {
  content: "\f466"; }

.fa-venus-mars::before {
  content: "\f228"; }

.fa-arrow-pointer::before {
  content: "\f245"; }

.fa-mouse-pointer::before {
  content: "\f245"; }

.fa-maximize::before {
  content: "\f31e"; }

.fa-expand-arrows-alt::before {
  content: "\f31e"; }

.fa-charging-station::before {
  content: "\f5e7"; }

.fa-shapes::before {
  content: "\f61f"; }

.fa-triangle-circle-square::before {
  content: "\f61f"; }

.fa-shuffle::before {
  content: "\f074"; }

.fa-random::before {
  content: "\f074"; }

.fa-person-running::before {
  content: "\f70c"; }

.fa-running::before {
  content: "\f70c"; }

.fa-mobile-retro::before {
  content: "\e527"; }

.fa-grip-lines-vertical::before {
  content: "\f7a5"; }

.fa-spider::before {
  content: "\f717"; }

.fa-hands-bound::before {
  content: "\e4f9"; }

.fa-file-invoice-dollar::before {
  content: "\f571"; }

.fa-plane-circle-exclamation::before {
  content: "\e556"; }

.fa-x-ray::before {
  content: "\f497"; }

.fa-spell-check::before {
  content: "\f891"; }

.fa-slash::before {
  content: "\f715"; }

.fa-computer-mouse::before {
  content: "\f8cc"; }

.fa-mouse::before {
  content: "\f8cc"; }

.fa-arrow-right-to-bracket::before {
  content: "\f090"; }

.fa-sign-in::before {
  content: "\f090"; }

.fa-shop-slash::before {
  content: "\e070"; }

.fa-store-alt-slash::before {
  content: "\e070"; }

.fa-server::before {
  content: "\f233"; }

.fa-virus-covid-slash::before {
  content: "\e4a9"; }

.fa-shop-lock::before {
  content: "\e4a5"; }

.fa-hourglass-start::before {
  content: "\f251"; }

.fa-hourglass-1::before {
  content: "\f251"; }

.fa-blender-phone::before {
  content: "\f6b6"; }

.fa-building-wheat::before {
  content: "\e4db"; }

.fa-person-breastfeeding::before {
  content: "\e53a"; }

.fa-right-to-bracket::before {
  content: "\f2f6"; }

.fa-sign-in-alt::before {
  content: "\f2f6"; }

.fa-venus::before {
  content: "\f221"; }

.fa-passport::before {
  content: "\f5ab"; }

.fa-heart-pulse::before {
  content: "\f21e"; }

.fa-heartbeat::before {
  content: "\f21e"; }

.fa-people-carry-box::before {
  content: "\f4ce"; }

.fa-people-carry::before {
  content: "\f4ce"; }

.fa-temperature-high::before {
  content: "\f769"; }

.fa-microchip::before {
  content: "\f2db"; }

.fa-crown::before {
  content: "\f521"; }

.fa-weight-hanging::before {
  content: "\f5cd"; }

.fa-xmarks-lines::before {
  content: "\e59a"; }

.fa-file-prescription::before {
  content: "\f572"; }

.fa-weight-scale::before {
  content: "\f496"; }

.fa-weight::before {
  content: "\f496"; }

.fa-user-group::before {
  content: "\f500"; }

.fa-user-friends::before {
  content: "\f500"; }

.fa-arrow-up-a-z::before {
  content: "\f15e"; }

.fa-sort-alpha-up::before {
  content: "\f15e"; }

.fa-chess-knight::before {
  content: "\f441"; }

.fa-face-laugh-squint::before {
  content: "\f59b"; }

.fa-laugh-squint::before {
  content: "\f59b"; }

.fa-wheelchair::before {
  content: "\f193"; }

.fa-circle-arrow-up::before {
  content: "\f0aa"; }

.fa-arrow-circle-up::before {
  content: "\f0aa"; }

.fa-toggle-on::before {
  content: "\f205"; }

.fa-person-walking::before {
  content: "\f554"; }

.fa-walking::before {
  content: "\f554"; }

.fa-l::before {
  content: "\4c"; }

.fa-fire::before {
  content: "\f06d"; }

.fa-bed-pulse::before {
  content: "\f487"; }

.fa-procedures::before {
  content: "\f487"; }

.fa-shuttle-space::before {
  content: "\f197"; }

.fa-space-shuttle::before {
  content: "\f197"; }

.fa-face-laugh::before {
  content: "\f599"; }

.fa-laugh::before {
  content: "\f599"; }

.fa-folder-open::before {
  content: "\f07c"; }

.fa-heart-circle-plus::before {
  content: "\e500"; }

.fa-code-fork::before {
  content: "\e13b"; }

.fa-city::before {
  content: "\f64f"; }

.fa-microphone-lines::before {
  content: "\f3c9"; }

.fa-microphone-alt::before {
  content: "\f3c9"; }

.fa-pepper-hot::before {
  content: "\f816"; }

.fa-unlock::before {
  content: "\f09c"; }

.fa-colon-sign::before {
  content: "\e140"; }

.fa-headset::before {
  content: "\f590"; }

.fa-store-slash::before {
  content: "\e071"; }

.fa-road-circle-xmark::before {
  content: "\e566"; }

.fa-user-minus::before {
  content: "\f503"; }

.fa-mars-stroke-up::before {
  content: "\f22a"; }

.fa-mars-stroke-v::before {
  content: "\f22a"; }

.fa-champagne-glasses::before {
  content: "\f79f"; }

.fa-glass-cheers::before {
  content: "\f79f"; }

.fa-clipboard::before {
  content: "\f328"; }

.fa-house-circle-exclamation::before {
  content: "\e50a"; }

.fa-file-arrow-up::before {
  content: "\f574"; }

.fa-file-upload::before {
  content: "\f574"; }

.fa-wifi::before {
  content: "\f1eb"; }

.fa-wifi-3::before {
  content: "\f1eb"; }

.fa-wifi-strong::before {
  content: "\f1eb"; }

.fa-bath::before {
  content: "\f2cd"; }

.fa-bathtub::before {
  content: "\f2cd"; }

.fa-underline::before {
  content: "\f0cd"; }

.fa-user-pen::before {
  content: "\f4ff"; }

.fa-user-edit::before {
  content: "\f4ff"; }

.fa-signature::before {
  content: "\f5b7"; }

.fa-stroopwafel::before {
  content: "\f551"; }

.fa-bold::before {
  content: "\f032"; }

.fa-anchor-lock::before {
  content: "\e4ad"; }

.fa-building-ngo::before {
  content: "\e4d7"; }

.fa-manat-sign::before {
  content: "\e1d5"; }

.fa-not-equal::before {
  content: "\f53e"; }

.fa-border-top-left::before {
  content: "\f853"; }

.fa-border-style::before {
  content: "\f853"; }

.fa-map-location-dot::before {
  content: "\f5a0"; }

.fa-map-marked-alt::before {
  content: "\f5a0"; }

.fa-jedi::before {
  content: "\f669"; }

.fa-square-poll-vertical::before {
  content: "\f681"; }

.fa-poll::before {
  content: "\f681"; }

.fa-mug-hot::before {
  content: "\f7b6"; }

.fa-car-battery::before {
  content: "\f5df"; }

.fa-battery-car::before {
  content: "\f5df"; }

.fa-gift::before {
  content: "\f06b"; }

.fa-dice-two::before {
  content: "\f528"; }

.fa-chess-queen::before {
  content: "\f445"; }

.fa-glasses::before {
  content: "\f530"; }

.fa-chess-board::before {
  content: "\f43c"; }

.fa-building-circle-check::before {
  content: "\e4d2"; }

.fa-person-chalkboard::before {
  content: "\e53d"; }

.fa-mars-stroke-right::before {
  content: "\f22b"; }

.fa-mars-stroke-h::before {
  content: "\f22b"; }

.fa-hand-back-fist::before {
  content: "\f255"; }

.fa-hand-rock::before {
  content: "\f255"; }

.fa-square-caret-up::before {
  content: "\f151"; }

.fa-caret-square-up::before {
  content: "\f151"; }

.fa-cloud-showers-water::before {
  content: "\e4e4"; }

.fa-chart-bar::before {
  content: "\f080"; }

.fa-bar-chart::before {
  content: "\f080"; }

.fa-hands-bubbles::before {
  content: "\e05e"; }

.fa-hands-wash::before {
  content: "\e05e"; }

.fa-less-than-equal::before {
  content: "\f537"; }

.fa-train::before {
  content: "\f238"; }

.fa-eye-low-vision::before {
  content: "\f2a8"; }

.fa-low-vision::before {
  content: "\f2a8"; }

.fa-crow::before {
  content: "\f520"; }

.fa-sailboat::before {
  content: "\e445"; }

.fa-window-restore::before {
  content: "\f2d2"; }

.fa-square-plus::before {
  content: "\f0fe"; }

.fa-plus-square::before {
  content: "\f0fe"; }

.fa-torii-gate::before {
  content: "\f6a1"; }

.fa-frog::before {
  content: "\f52e"; }

.fa-bucket::before {
  content: "\e4cf"; }

.fa-image::before {
  content: "\f03e"; }

.fa-microphone::before {
  content: "\f130"; }

.fa-cow::before {
  content: "\f6c8"; }

.fa-caret-up::before {
  content: "\f0d8"; }

.fa-screwdriver::before {
  content: "\f54a"; }

.fa-folder-closed::before {
  content: "\e185"; }

.fa-house-tsunami::before {
  content: "\e515"; }

.fa-square-nfi::before {
  content: "\e576"; }

.fa-arrow-up-from-ground-water::before {
  content: "\e4b5"; }

.fa-martini-glass::before {
  content: "\f57b"; }

.fa-glass-martini-alt::before {
  content: "\f57b"; }

.fa-rotate-left::before {
  content: "\f2ea"; }

.fa-rotate-back::before {
  content: "\f2ea"; }

.fa-rotate-backward::before {
  content: "\f2ea"; }

.fa-undo-alt::before {
  content: "\f2ea"; }

.fa-table-columns::before {
  content: "\f0db"; }

.fa-columns::before {
  content: "\f0db"; }

.fa-lemon::before {
  content: "\f094"; }

.fa-head-side-mask::before {
  content: "\e063"; }

.fa-handshake::before {
  content: "\f2b5"; }

.fa-gem::before {
  content: "\f3a5"; }

.fa-dolly::before {
  content: "\f472"; }

.fa-dolly-box::before {
  content: "\f472"; }

.fa-smoking::before {
  content: "\f48d"; }

.fa-minimize::before {
  content: "\f78c"; }

.fa-compress-arrows-alt::before {
  content: "\f78c"; }

.fa-monument::before {
  content: "\f5a6"; }

.fa-snowplow::before {
  content: "\f7d2"; }

.fa-angles-right::before {
  content: "\f101"; }

.fa-angle-double-right::before {
  content: "\f101"; }

.fa-cannabis::before {
  content: "\f55f"; }

.fa-circle-play::before {
  content: "\f144"; }

.fa-play-circle::before {
  content: "\f144"; }

.fa-tablets::before {
  content: "\f490"; }

.fa-ethernet::before {
  content: "\f796"; }

.fa-euro-sign::before {
  content: "\f153"; }

.fa-eur::before {
  content: "\f153"; }

.fa-euro::before {
  content: "\f153"; }

.fa-chair::before {
  content: "\f6c0"; }

.fa-circle-check::before {
  content: "\f058"; }

.fa-check-circle::before {
  content: "\f058"; }

.fa-circle-stop::before {
  content: "\f28d"; }

.fa-stop-circle::before {
  content: "\f28d"; }

.fa-compass-drafting::before {
  content: "\f568"; }

.fa-drafting-compass::before {
  content: "\f568"; }

.fa-plate-wheat::before {
  content: "\e55a"; }

.fa-icicles::before {
  content: "\f7ad"; }

.fa-person-shelter::before {
  content: "\e54f"; }

.fa-neuter::before {
  content: "\f22c"; }

.fa-id-badge::before {
  content: "\f2c1"; }

.fa-marker::before {
  content: "\f5a1"; }

.fa-face-laugh-beam::before {
  content: "\f59a"; }

.fa-laugh-beam::before {
  content: "\f59a"; }

.fa-helicopter-symbol::before {
  content: "\e502"; }

.fa-universal-access::before {
  content: "\f29a"; }

.fa-circle-chevron-up::before {
  content: "\f139"; }

.fa-chevron-circle-up::before {
  content: "\f139"; }

.fa-lari-sign::before {
  content: "\e1c8"; }

.fa-volcano::before {
  content: "\f770"; }

.fa-person-walking-dashed-line-arrow-right::before {
  content: "\e553"; }

.fa-sterling-sign::before {
  content: "\f154"; }

.fa-gbp::before {
  content: "\f154"; }

.fa-pound-sign::before {
  content: "\f154"; }

.fa-viruses::before {
  content: "\e076"; }

.fa-square-person-confined::before {
  content: "\e577"; }

.fa-user-tie::before {
  content: "\f508"; }

.fa-arrow-down-long::before {
  content: "\f175"; }

.fa-long-arrow-down::before {
  content: "\f175"; }

.fa-tent-arrow-down-to-line::before {
  content: "\e57e"; }

.fa-certificate::before {
  content: "\f0a3"; }

.fa-reply-all::before {
  content: "\f122"; }

.fa-mail-reply-all::before {
  content: "\f122"; }

.fa-suitcase::before {
  content: "\f0f2"; }

.fa-person-skating::before {
  content: "\f7c5"; }

.fa-skating::before {
  content: "\f7c5"; }

.fa-filter-circle-dollar::before {
  content: "\f662"; }

.fa-funnel-dollar::before {
  content: "\f662"; }

.fa-camera-retro::before {
  content: "\f083"; }

.fa-circle-arrow-down::before {
  content: "\f0ab"; }

.fa-arrow-circle-down::before {
  content: "\f0ab"; }

.fa-file-import::before {
  content: "\f56f"; }

.fa-arrow-right-to-file::before {
  content: "\f56f"; }

.fa-square-arrow-up-right::before {
  content: "\f14c"; }

.fa-external-link-square::before {
  content: "\f14c"; }

.fa-box-open::before {
  content: "\f49e"; }

.fa-scroll::before {
  content: "\f70e"; }

.fa-spa::before {
  content: "\f5bb"; }

.fa-location-pin-lock::before {
  content: "\e51f"; }

.fa-pause::before {
  content: "\f04c"; }

.fa-hill-avalanche::before {
  content: "\e507"; }

.fa-temperature-empty::before {
  content: "\f2cb"; }

.fa-temperature-0::before {
  content: "\f2cb"; }

.fa-thermometer-0::before {
  content: "\f2cb"; }

.fa-thermometer-empty::before {
  content: "\f2cb"; }

.fa-bomb::before {
  content: "\f1e2"; }

.fa-registered::before {
  content: "\f25d"; }

.fa-address-card::before {
  content: "\f2bb"; }

.fa-contact-card::before {
  content: "\f2bb"; }

.fa-vcard::before {
  content: "\f2bb"; }

.fa-scale-unbalanced-flip::before {
  content: "\f516"; }

.fa-balance-scale-right::before {
  content: "\f516"; }

.fa-subscript::before {
  content: "\f12c"; }

.fa-diamond-turn-right::before {
  content: "\f5eb"; }

.fa-directions::before {
  content: "\f5eb"; }

.fa-burst::before {
  content: "\e4dc"; }

.fa-house-laptop::before {
  content: "\e066"; }

.fa-laptop-house::before {
  content: "\e066"; }

.fa-face-tired::before {
  content: "\f5c8"; }

.fa-tired::before {
  content: "\f5c8"; }

.fa-money-bills::before {
  content: "\e1f3"; }

.fa-smog::before {
  content: "\f75f"; }

.fa-crutch::before {
  content: "\f7f7"; }

.fa-cloud-arrow-up::before {
  content: "\f0ee"; }

.fa-cloud-upload::before {
  content: "\f0ee"; }

.fa-cloud-upload-alt::before {
  content: "\f0ee"; }

.fa-palette::before {
  content: "\f53f"; }

.fa-arrows-turn-right::before {
  content: "\e4c0"; }

.fa-vest::before {
  content: "\e085"; }

.fa-ferry::before {
  content: "\e4ea"; }

.fa-arrows-down-to-people::before {
  content: "\e4b9"; }

.fa-seedling::before {
  content: "\f4d8"; }

.fa-sprout::before {
  content: "\f4d8"; }

.fa-left-right::before {
  content: "\f337"; }

.fa-arrows-alt-h::before {
  content: "\f337"; }

.fa-boxes-packing::before {
  content: "\e4c7"; }

.fa-circle-arrow-left::before {
  content: "\f0a8"; }

.fa-arrow-circle-left::before {
  content: "\f0a8"; }

.fa-group-arrows-rotate::before {
  content: "\e4f6"; }

.fa-bowl-food::before {
  content: "\e4c6"; }

.fa-candy-cane::before {
  content: "\f786"; }

.fa-arrow-down-wide-short::before {
  content: "\f160"; }

.fa-sort-amount-asc::before {
  content: "\f160"; }

.fa-sort-amount-down::before {
  content: "\f160"; }

.fa-cloud-bolt::before {
  content: "\f76c"; }

.fa-thunderstorm::before {
  content: "\f76c"; }

.fa-text-slash::before {
  content: "\f87d"; }

.fa-remove-format::before {
  content: "\f87d"; }

.fa-face-smile-wink::before {
  content: "\f4da"; }

.fa-smile-wink::before {
  content: "\f4da"; }

.fa-file-word::before {
  content: "\f1c2"; }

.fa-file-powerpoint::before {
  content: "\f1c4"; }

.fa-arrows-left-right::before {
  content: "\f07e"; }

.fa-arrows-h::before {
  content: "\f07e"; }

.fa-house-lock::before {
  content: "\e510"; }

.fa-cloud-arrow-down::before {
  content: "\f0ed"; }

.fa-cloud-download::before {
  content: "\f0ed"; }

.fa-cloud-download-alt::before {
  content: "\f0ed"; }

.fa-children::before {
  content: "\e4e1"; }

.fa-chalkboard::before {
  content: "\f51b"; }

.fa-blackboard::before {
  content: "\f51b"; }

.fa-user-large-slash::before {
  content: "\f4fa"; }

.fa-user-alt-slash::before {
  content: "\f4fa"; }

.fa-envelope-open::before {
  content: "\f2b6"; }

.fa-handshake-simple-slash::before {
  content: "\e05f"; }

.fa-handshake-alt-slash::before {
  content: "\e05f"; }

.fa-mattress-pillow::before {
  content: "\e525"; }

.fa-guarani-sign::before {
  content: "\e19a"; }

.fa-arrows-rotate::before {
  content: "\f021"; }

.fa-refresh::before {
  content: "\f021"; }

.fa-sync::before {
  content: "\f021"; }

.fa-fire-extinguisher::before {
  content: "\f134"; }

.fa-cruzeiro-sign::before {
  content: "\e152"; }

.fa-greater-than-equal::before {
  content: "\f532"; }

.fa-shield-halved::before {
  content: "\f3ed"; }

.fa-shield-alt::before {
  content: "\f3ed"; }

.fa-book-atlas::before {
  content: "\f558"; }

.fa-atlas::before {
  content: "\f558"; }

.fa-virus::before {
  content: "\e074"; }

.fa-envelope-circle-check::before {
  content: "\e4e8"; }

.fa-layer-group::before {
  content: "\f5fd"; }

.fa-arrows-to-dot::before {
  content: "\e4be"; }

.fa-archway::before {
  content: "\f557"; }

.fa-heart-circle-check::before {
  content: "\e4fd"; }

.fa-house-chimney-crack::before {
  content: "\f6f1"; }

.fa-house-damage::before {
  content: "\f6f1"; }

.fa-file-zipper::before {
  content: "\f1c6"; }

.fa-file-archive::before {
  content: "\f1c6"; }

.fa-square::before {
  content: "\f0c8"; }

.fa-martini-glass-empty::before {
  content: "\f000"; }

.fa-glass-martini::before {
  content: "\f000"; }

.fa-couch::before {
  content: "\f4b8"; }

.fa-cedi-sign::before {
  content: "\e0df"; }

.fa-italic::before {
  content: "\f033"; }

.fa-church::before {
  content: "\f51d"; }

.fa-comments-dollar::before {
  content: "\f653"; }

.fa-democrat::before {
  content: "\f747"; }

.fa-z::before {
  content: "\5a"; }

.fa-person-skiing::before {
  content: "\f7c9"; }

.fa-skiing::before {
  content: "\f7c9"; }

.fa-road-lock::before {
  content: "\e567"; }

.fa-a::before {
  content: "\41"; }

.fa-temperature-arrow-down::before {
  content: "\e03f"; }

.fa-temperature-down::before {
  content: "\e03f"; }

.fa-feather-pointed::before {
  content: "\f56b"; }

.fa-feather-alt::before {
  content: "\f56b"; }

.fa-p::before {
  content: "\50"; }

.fa-snowflake::before {
  content: "\f2dc"; }

.fa-newspaper::before {
  content: "\f1ea"; }

.fa-rectangle-ad::before {
  content: "\f641"; }

.fa-ad::before {
  content: "\f641"; }

.fa-circle-arrow-right::before {
  content: "\f0a9"; }

.fa-arrow-circle-right::before {
  content: "\f0a9"; }

.fa-filter-circle-xmark::before {
  content: "\e17b"; }

.fa-locust::before {
  content: "\e520"; }

.fa-sort::before {
  content: "\f0dc"; }

.fa-unsorted::before {
  content: "\f0dc"; }

.fa-list-ol::before {
  content: "\f0cb"; }

.fa-list-1-2::before {
  content: "\f0cb"; }

.fa-list-numeric::before {
  content: "\f0cb"; }

.fa-person-dress-burst::before {
  content: "\e544"; }

.fa-money-check-dollar::before {
  content: "\f53d"; }

.fa-money-check-alt::before {
  content: "\f53d"; }

.fa-vector-square::before {
  content: "\f5cb"; }

.fa-bread-slice::before {
  content: "\f7ec"; }

.fa-language::before {
  content: "\f1ab"; }

.fa-face-kiss-wink-heart::before {
  content: "\f598"; }

.fa-kiss-wink-heart::before {
  content: "\f598"; }

.fa-filter::before {
  content: "\f0b0"; }

.fa-question::before {
  content: "\3f"; }

.fa-file-signature::before {
  content: "\f573"; }

.fa-up-down-left-right::before {
  content: "\f0b2"; }

.fa-arrows-alt::before {
  content: "\f0b2"; }

.fa-house-chimney-user::before {
  content: "\e065"; }

.fa-hand-holding-heart::before {
  content: "\f4be"; }

.fa-puzzle-piece::before {
  content: "\f12e"; }

.fa-money-check::before {
  content: "\f53c"; }

.fa-star-half-stroke::before {
  content: "\f5c0"; }

.fa-star-half-alt::before {
  content: "\f5c0"; }

.fa-code::before {
  content: "\f121"; }

.fa-whiskey-glass::before {
  content: "\f7a0"; }

.fa-glass-whiskey::before {
  content: "\f7a0"; }

.fa-building-circle-exclamation::before {
  content: "\e4d3"; }

.fa-magnifying-glass-chart::before {
  content: "\e522"; }

.fa-arrow-up-right-from-square::before {
  content: "\f08e"; }

.fa-external-link::before {
  content: "\f08e"; }

.fa-cubes-stacked::before {
  content: "\e4e6"; }

.fa-won-sign::before {
  content: "\f159"; }

.fa-krw::before {
  content: "\f159"; }

.fa-won::before {
  content: "\f159"; }

.fa-virus-covid::before {
  content: "\e4a8"; }

.fa-austral-sign::before {
  content: "\e0a9"; }

.fa-f::before {
  content: "\46"; }

.fa-leaf::before {
  content: "\f06c"; }

.fa-road::before {
  content: "\f018"; }

.fa-taxi::before {
  content: "\f1ba"; }

.fa-cab::before {
  content: "\f1ba"; }

.fa-person-circle-plus::before {
  content: "\e541"; }

.fa-chart-pie::before {
  content: "\f200"; }

.fa-pie-chart::before {
  content: "\f200"; }

.fa-bolt-lightning::before {
  content: "\e0b7"; }

.fa-sack-xmark::before {
  content: "\e56a"; }

.fa-file-excel::before {
  content: "\f1c3"; }

.fa-file-contract::before {
  content: "\f56c"; }

.fa-fish-fins::before {
  content: "\e4f2"; }

.fa-building-flag::before {
  content: "\e4d5"; }

.fa-face-grin-beam::before {
  content: "\f582"; }

.fa-grin-beam::before {
  content: "\f582"; }

.fa-object-ungroup::before {
  content: "\f248"; }

.fa-poop::before {
  content: "\f619"; }

.fa-location-pin::before {
  content: "\f041"; }

.fa-map-marker::before {
  content: "\f041"; }

.fa-kaaba::before {
  content: "\f66b"; }

.fa-toilet-paper::before {
  content: "\f71e"; }

.fa-helmet-safety::before {
  content: "\f807"; }

.fa-hard-hat::before {
  content: "\f807"; }

.fa-hat-hard::before {
  content: "\f807"; }

.fa-eject::before {
  content: "\f052"; }

.fa-circle-right::before {
  content: "\f35a"; }

.fa-arrow-alt-circle-right::before {
  content: "\f35a"; }

.fa-plane-circle-check::before {
  content: "\e555"; }

.fa-face-rolling-eyes::before {
  content: "\f5a5"; }

.fa-meh-rolling-eyes::before {
  content: "\f5a5"; }

.fa-object-group::before {
  content: "\f247"; }

.fa-chart-line::before {
  content: "\f201"; }

.fa-line-chart::before {
  content: "\f201"; }

.fa-mask-ventilator::before {
  content: "\e524"; }

.fa-arrow-right::before {
  content: "\f061"; }

.fa-signs-post::before {
  content: "\f277"; }

.fa-map-signs::before {
  content: "\f277"; }

.fa-cash-register::before {
  content: "\f788"; }

.fa-person-circle-question::before {
  content: "\e542"; }

.fa-h::before {
  content: "\48"; }

.fa-tarp::before {
  content: "\e57b"; }

.fa-screwdriver-wrench::before {
  content: "\f7d9"; }

.fa-tools::before {
  content: "\f7d9"; }

.fa-arrows-to-eye::before {
  content: "\e4bf"; }

.fa-plug-circle-bolt::before {
  content: "\e55b"; }

.fa-heart::before {
  content: "\f004"; }

.fa-mars-and-venus::before {
  content: "\f224"; }

.fa-house-user::before {
  content: "\e1b0"; }

.fa-home-user::before {
  content: "\e1b0"; }

.fa-dumpster-fire::before {
  content: "\f794"; }

.fa-house-crack::before {
  content: "\e3b1"; }

.fa-martini-glass-citrus::before {
  content: "\f561"; }

.fa-cocktail::before {
  content: "\f561"; }

.fa-face-surprise::before {
  content: "\f5c2"; }

.fa-surprise::before {
  content: "\f5c2"; }

.fa-bottle-water::before {
  content: "\e4c5"; }

.fa-circle-pause::before {
  content: "\f28b"; }

.fa-pause-circle::before {
  content: "\f28b"; }

.fa-toilet-paper-slash::before {
  content: "\e072"; }

.fa-apple-whole::before {
  content: "\f5d1"; }

.fa-apple-alt::before {
  content: "\f5d1"; }

.fa-kitchen-set::before {
  content: "\e51a"; }

.fa-r::before {
  content: "\52"; }

.fa-temperature-quarter::before {
  content: "\f2ca"; }

.fa-temperature-1::before {
  content: "\f2ca"; }

.fa-thermometer-1::before {
  content: "\f2ca"; }

.fa-thermometer-quarter::before {
  content: "\f2ca"; }

.fa-cube::before {
  content: "\f1b2"; }

.fa-bitcoin-sign::before {
  content: "\e0b4"; }

.fa-shield-dog::before {
  content: "\e573"; }

.fa-solar-panel::before {
  content: "\f5ba"; }

.fa-lock-open::before {
  content: "\f3c1"; }

.fa-elevator::before {
  content: "\e16d"; }

.fa-money-bill-transfer::before {
  content: "\e528"; }

.fa-money-bill-trend-up::before {
  content: "\e529"; }

.fa-house-flood-water-circle-arrow-right::before {
  content: "\e50f"; }

.fa-square-poll-horizontal::before {
  content: "\f682"; }

.fa-poll-h::before {
  content: "\f682"; }

.fa-circle::before {
  content: "\f111"; }

.fa-backward-fast::before {
  content: "\f049"; }

.fa-fast-backward::before {
  content: "\f049"; }

.fa-recycle::before {
  content: "\f1b8"; }

.fa-user-astronaut::before {
  content: "\f4fb"; }

.fa-plane-slash::before {
  content: "\e069"; }

.fa-trademark::before {
  content: "\f25c"; }

.fa-basketball::before {
  content: "\f434"; }

.fa-basketball-ball::before {
  content: "\f434"; }

.fa-satellite-dish::before {
  content: "\f7c0"; }

.fa-circle-up::before {
  content: "\f35b"; }

.fa-arrow-alt-circle-up::before {
  content: "\f35b"; }

.fa-mobile-screen-button::before {
  content: "\f3cd"; }

.fa-mobile-alt::before {
  content: "\f3cd"; }

.fa-volume-high::before {
  content: "\f028"; }

.fa-volume-up::before {
  content: "\f028"; }

.fa-users-rays::before {
  content: "\e593"; }

.fa-wallet::before {
  content: "\f555"; }

.fa-clipboard-check::before {
  content: "\f46c"; }

.fa-file-audio::before {
  content: "\f1c7"; }

.fa-burger::before {
  content: "\f805"; }

.fa-hamburger::before {
  content: "\f805"; }

.fa-wrench::before {
  content: "\f0ad"; }

.fa-bugs::before {
  content: "\e4d0"; }

.fa-rupee-sign::before {
  content: "\f156"; }

.fa-rupee::before {
  content: "\f156"; }

.fa-file-image::before {
  content: "\f1c5"; }

.fa-circle-question::before {
  content: "\f059"; }

.fa-question-circle::before {
  content: "\f059"; }

.fa-plane-departure::before {
  content: "\f5b0"; }

.fa-handshake-slash::before {
  content: "\e060"; }

.fa-book-bookmark::before {
  content: "\e0bb"; }

.fa-code-branch::before {
  content: "\f126"; }

.fa-hat-cowboy::before {
  content: "\f8c0"; }

.fa-bridge::before {
  content: "\e4c8"; }

.fa-phone-flip::before {
  content: "\f879"; }

.fa-phone-alt::before {
  content: "\f879"; }

.fa-truck-front::before {
  content: "\e2b7"; }

.fa-cat::before {
  content: "\f6be"; }

.fa-anchor-circle-exclamation::before {
  content: "\e4ab"; }

.fa-truck-field::before {
  content: "\e58d"; }

.fa-route::before {
  content: "\f4d7"; }

.fa-clipboard-question::before {
  content: "\e4e3"; }

.fa-panorama::before {
  content: "\e209"; }

.fa-comment-medical::before {
  content: "\f7f5"; }

.fa-teeth-open::before {
  content: "\f62f"; }

.fa-file-circle-minus::before {
  content: "\e4ed"; }

.fa-tags::before {
  content: "\f02c"; }

.fa-wine-glass::before {
  content: "\f4e3"; }

.fa-forward-fast::before {
  content: "\f050"; }

.fa-fast-forward::before {
  content: "\f050"; }

.fa-face-meh-blank::before {
  content: "\f5a4"; }

.fa-meh-blank::before {
  content: "\f5a4"; }

.fa-square-parking::before {
  content: "\f540"; }

.fa-parking::before {
  content: "\f540"; }

.fa-house-signal::before {
  content: "\e012"; }

.fa-bars-progress::before {
  content: "\f828"; }

.fa-tasks-alt::before {
  content: "\f828"; }

.fa-faucet-drip::before {
  content: "\e006"; }

.fa-cart-flatbed::before {
  content: "\f474"; }

.fa-dolly-flatbed::before {
  content: "\f474"; }

.fa-ban-smoking::before {
  content: "\f54d"; }

.fa-smoking-ban::before {
  content: "\f54d"; }

.fa-terminal::before {
  content: "\f120"; }

.fa-mobile-button::before {
  content: "\f10b"; }

.fa-house-medical-flag::before {
  content: "\e514"; }

.fa-basket-shopping::before {
  content: "\f291"; }

.fa-shopping-basket::before {
  content: "\f291"; }

.fa-tape::before {
  content: "\f4db"; }

.fa-bus-simple::before {
  content: "\f55e"; }

.fa-bus-alt::before {
  content: "\f55e"; }

.fa-eye::before {
  content: "\f06e"; }

.fa-face-sad-cry::before {
  content: "\f5b3"; }

.fa-sad-cry::before {
  content: "\f5b3"; }

.fa-audio-description::before {
  content: "\f29e"; }

.fa-person-military-to-person::before {
  content: "\e54c"; }

.fa-file-shield::before {
  content: "\e4f0"; }

.fa-user-slash::before {
  content: "\f506"; }

.fa-pen::before {
  content: "\f304"; }

.fa-tower-observation::before {
  content: "\e586"; }

.fa-file-code::before {
  content: "\f1c9"; }

.fa-signal::before {
  content: "\f012"; }

.fa-signal-5::before {
  content: "\f012"; }

.fa-signal-perfect::before {
  content: "\f012"; }

.fa-bus::before {
  content: "\f207"; }

.fa-heart-circle-xmark::before {
  content: "\e501"; }

.fa-house-chimney::before {
  content: "\e3af"; }

.fa-home-lg::before {
  content: "\e3af"; }

.fa-window-maximize::before {
  content: "\f2d0"; }

.fa-face-frown::before {
  content: "\f119"; }

.fa-frown::before {
  content: "\f119"; }

.fa-prescription::before {
  content: "\f5b1"; }

.fa-shop::before {
  content: "\f54f"; }

.fa-store-alt::before {
  content: "\f54f"; }

.fa-floppy-disk::before {
  content: "\f0c7"; }

.fa-save::before {
  content: "\f0c7"; }

.fa-vihara::before {
  content: "\f6a7"; }

.fa-scale-unbalanced::before {
  content: "\f515"; }

.fa-balance-scale-left::before {
  content: "\f515"; }

.fa-sort-up::before {
  content: "\f0de"; }

.fa-sort-asc::before {
  content: "\f0de"; }

.fa-comment-dots::before {
  content: "\f4ad"; }

.fa-commenting::before {
  content: "\f4ad"; }

.fa-plant-wilt::before {
  content: "\e5aa"; }

.fa-diamond::before {
  content: "\f219"; }

.fa-face-grin-squint::before {
  content: "\f585"; }

.fa-grin-squint::before {
  content: "\f585"; }

.fa-hand-holding-dollar::before {
  content: "\f4c0"; }

.fa-hand-holding-usd::before {
  content: "\f4c0"; }

.fa-bacterium::before {
  content: "\e05a"; }

.fa-hand-pointer::before {
  content: "\f25a"; }

.fa-drum-steelpan::before {
  content: "\f56a"; }

.fa-hand-scissors::before {
  content: "\f257"; }

.fa-hands-praying::before {
  content: "\f684"; }

.fa-praying-hands::before {
  content: "\f684"; }

.fa-arrow-rotate-right::before {
  content: "\f01e"; }

.fa-arrow-right-rotate::before {
  content: "\f01e"; }

.fa-arrow-rotate-forward::before {
  content: "\f01e"; }

.fa-redo::before {
  content: "\f01e"; }

.fa-biohazard::before {
  content: "\f780"; }

.fa-location-crosshairs::before {
  content: "\f601"; }

.fa-location::before {
  content: "\f601"; }

.fa-mars-double::before {
  content: "\f227"; }

.fa-child-dress::before {
  content: "\e59c"; }

.fa-users-between-lines::before {
  content: "\e591"; }

.fa-lungs-virus::before {
  content: "\e067"; }

.fa-face-grin-tears::before {
  content: "\f588"; }

.fa-grin-tears::before {
  content: "\f588"; }

.fa-phone::before {
  content: "\f095"; }

.fa-calendar-xmark::before {
  content: "\f273"; }

.fa-calendar-times::before {
  content: "\f273"; }

.fa-child-reaching::before {
  content: "\e59d"; }

.fa-head-side-virus::before {
  content: "\e064"; }

.fa-user-gear::before {
  content: "\f4fe"; }

.fa-user-cog::before {
  content: "\f4fe"; }

.fa-arrow-up-1-9::before {
  content: "\f163"; }

.fa-sort-numeric-up::before {
  content: "\f163"; }

.fa-door-closed::before {
  content: "\f52a"; }

.fa-shield-virus::before {
  content: "\e06c"; }

.fa-dice-six::before {
  content: "\f526"; }

.fa-mosquito-net::before {
  content: "\e52c"; }

.fa-bridge-water::before {
  content: "\e4ce"; }

.fa-person-booth::before {
  content: "\f756"; }

.fa-text-width::before {
  content: "\f035"; }

.fa-hat-wizard::before {
  content: "\f6e8"; }

.fa-pen-fancy::before {
  content: "\f5ac"; }

.fa-person-digging::before {
  content: "\f85e"; }

.fa-digging::before {
  content: "\f85e"; }

.fa-trash::before {
  content: "\f1f8"; }

.fa-gauge-simple::before {
  content: "\f629"; }

.fa-gauge-simple-med::before {
  content: "\f629"; }

.fa-tachometer-average::before {
  content: "\f629"; }

.fa-book-medical::before {
  content: "\f7e6"; }

.fa-poo::before {
  content: "\f2fe"; }

.fa-quote-right::before {
  content: "\f10e"; }

.fa-quote-right-alt::before {
  content: "\f10e"; }

.fa-shirt::before {
  content: "\f553"; }

.fa-t-shirt::before {
  content: "\f553"; }

.fa-tshirt::before {
  content: "\f553"; }

.fa-cubes::before {
  content: "\f1b3"; }

.fa-divide::before {
  content: "\f529"; }

.fa-tenge-sign::before {
  content: "\f7d7"; }

.fa-tenge::before {
  content: "\f7d7"; }

.fa-headphones::before {
  content: "\f025"; }

.fa-hands-holding::before {
  content: "\f4c2"; }

.fa-hands-clapping::before {
  content: "\e1a8"; }

.fa-republican::before {
  content: "\f75e"; }

.fa-arrow-left::before {
  content: "\f060"; }

.fa-person-circle-xmark::before {
  content: "\e543"; }

.fa-ruler::before {
  content: "\f545"; }

.fa-align-left::before {
  content: "\f036"; }

.fa-dice-d6::before {
  content: "\f6d1"; }

.fa-restroom::before {
  content: "\f7bd"; }

.fa-j::before {
  content: "\4a"; }

.fa-users-viewfinder::before {
  content: "\e595"; }

.fa-file-video::before {
  content: "\f1c8"; }

.fa-up-right-from-square::before {
  content: "\f35d"; }

.fa-external-link-alt::before {
  content: "\f35d"; }

.fa-table-cells::before {
  content: "\f00a"; }

.fa-th::before {
  content: "\f00a"; }

.fa-file-pdf::before {
  content: "\f1c1"; }

.fa-book-bible::before {
  content: "\f647"; }

.fa-bible::before {
  content: "\f647"; }

.fa-o::before {
  content: "\4f"; }

.fa-suitcase-medical::before {
  content: "\f0fa"; }

.fa-medkit::before {
  content: "\f0fa"; }

.fa-user-secret::before {
  content: "\f21b"; }

.fa-otter::before {
  content: "\f700"; }

.fa-person-dress::before {
  content: "\f182"; }

.fa-female::before {
  content: "\f182"; }

.fa-comment-dollar::before {
  content: "\f651"; }

.fa-business-time::before {
  content: "\f64a"; }

.fa-briefcase-clock::before {
  content: "\f64a"; }

.fa-table-cells-large::before {
  content: "\f009"; }

.fa-th-large::before {
  content: "\f009"; }

.fa-book-tanakh::before {
  content: "\f827"; }

.fa-tanakh::before {
  content: "\f827"; }

.fa-phone-volume::before {
  content: "\f2a0"; }

.fa-volume-control-phone::before {
  content: "\f2a0"; }

.fa-hat-cowboy-side::before {
  content: "\f8c1"; }

.fa-clipboard-user::before {
  content: "\f7f3"; }

.fa-child::before {
  content: "\f1ae"; }

.fa-lira-sign::before {
  content: "\f195"; }

.fa-satellite::before {
  content: "\f7bf"; }

.fa-plane-lock::before {
  content: "\e558"; }

.fa-tag::before {
  content: "\f02b"; }

.fa-comment::before {
  content: "\f075"; }

.fa-cake-candles::before {
  content: "\f1fd"; }

.fa-birthday-cake::before {
  content: "\f1fd"; }

.fa-cake::before {
  content: "\f1fd"; }

.fa-envelope::before {
  content: "\f0e0"; }

.fa-angles-up::before {
  content: "\f102"; }

.fa-angle-double-up::before {
  content: "\f102"; }

.fa-paperclip::before {
  content: "\f0c6"; }

.fa-arrow-right-to-city::before {
  content: "\e4b3"; }

.fa-ribbon::before {
  content: "\f4d6"; }

.fa-lungs::before {
  content: "\f604"; }

.fa-arrow-up-9-1::before {
  content: "\f887"; }

.fa-sort-numeric-up-alt::before {
  content: "\f887"; }

.fa-litecoin-sign::before {
  content: "\e1d3"; }

.fa-border-none::before {
  content: "\f850"; }

.fa-circle-nodes::before {
  content: "\e4e2"; }

.fa-parachute-box::before {
  content: "\f4cd"; }

.fa-indent::before {
  content: "\f03c"; }

.fa-truck-field-un::before {
  content: "\e58e"; }

.fa-hourglass::before {
  content: "\f254"; }

.fa-hourglass-empty::before {
  content: "\f254"; }

.fa-mountain::before {
  content: "\f6fc"; }

.fa-user-doctor::before {
  content: "\f0f0"; }

.fa-user-md::before {
  content: "\f0f0"; }

.fa-circle-info::before {
  content: "\f05a"; }

.fa-info-circle::before {
  content: "\f05a"; }

.fa-cloud-meatball::before {
  content: "\f73b"; }

.fa-camera::before {
  content: "\f030"; }

.fa-camera-alt::before {
  content: "\f030"; }

.fa-square-virus::before {
  content: "\e578"; }

.fa-meteor::before {
  content: "\f753"; }

.fa-car-on::before {
  content: "\e4dd"; }

.fa-sleigh::before {
  content: "\f7cc"; }

.fa-arrow-down-1-9::before {
  content: "\f162"; }

.fa-sort-numeric-asc::before {
  content: "\f162"; }

.fa-sort-numeric-down::before {
  content: "\f162"; }

.fa-hand-holding-droplet::before {
  content: "\f4c1"; }

.fa-hand-holding-water::before {
  content: "\f4c1"; }

.fa-water::before {
  content: "\f773"; }

.fa-calendar-check::before {
  content: "\f274"; }

.fa-braille::before {
  content: "\f2a1"; }

.fa-prescription-bottle-medical::before {
  content: "\f486"; }

.fa-prescription-bottle-alt::before {
  content: "\f486"; }

.fa-landmark::before {
  content: "\f66f"; }

.fa-truck::before {
  content: "\f0d1"; }

.fa-crosshairs::before {
  content: "\f05b"; }

.fa-person-cane::before {
  content: "\e53c"; }

.fa-tent::before {
  content: "\e57d"; }

.fa-vest-patches::before {
  content: "\e086"; }

.fa-check-double::before {
  content: "\f560"; }

.fa-arrow-down-a-z::before {
  content: "\f15d"; }

.fa-sort-alpha-asc::before {
  content: "\f15d"; }

.fa-sort-alpha-down::before {
  content: "\f15d"; }

.fa-money-bill-wheat::before {
  content: "\e52a"; }

.fa-cookie::before {
  content: "\f563"; }

.fa-arrow-rotate-left::before {
  content: "\f0e2"; }

.fa-arrow-left-rotate::before {
  content: "\f0e2"; }

.fa-arrow-rotate-back::before {
  content: "\f0e2"; }

.fa-arrow-rotate-backward::before {
  content: "\f0e2"; }

.fa-undo::before {
  content: "\f0e2"; }

.fa-hard-drive::before {
  content: "\f0a0"; }

.fa-hdd::before {
  content: "\f0a0"; }

.fa-face-grin-squint-tears::before {
  content: "\f586"; }

.fa-grin-squint-tears::before {
  content: "\f586"; }

.fa-dumbbell::before {
  content: "\f44b"; }

.fa-rectangle-list::before {
  content: "\f022"; }

.fa-list-alt::before {
  content: "\f022"; }

.fa-tarp-droplet::before {
  content: "\e57c"; }

.fa-house-medical-circle-check::before {
  content: "\e511"; }

.fa-person-skiing-nordic::before {
  content: "\f7ca"; }

.fa-skiing-nordic::before {
  content: "\f7ca"; }

.fa-calendar-plus::before {
  content: "\f271"; }

.fa-plane-arrival::before {
  content: "\f5af"; }

.fa-circle-left::before {
  content: "\f359"; }

.fa-arrow-alt-circle-left::before {
  content: "\f359"; }

.fa-train-subway::before {
  content: "\f239"; }

.fa-subway::before {
  content: "\f239"; }

.fa-chart-gantt::before {
  content: "\e0e4"; }

.fa-indian-rupee-sign::before {
  content: "\e1bc"; }

.fa-indian-rupee::before {
  content: "\e1bc"; }

.fa-inr::before {
  content: "\e1bc"; }

.fa-crop-simple::before {
  content: "\f565"; }

.fa-crop-alt::before {
  content: "\f565"; }

.fa-money-bill-1::before {
  content: "\f3d1"; }

.fa-money-bill-alt::before {
  content: "\f3d1"; }

.fa-left-long::before {
  content: "\f30a"; }

.fa-long-arrow-alt-left::before {
  content: "\f30a"; }

.fa-dna::before {
  content: "\f471"; }

.fa-virus-slash::before {
  content: "\e075"; }

.fa-minus::before {
  content: "\f068"; }

.fa-subtract::before {
  content: "\f068"; }

.fa-chess::before {
  content: "\f439"; }

.fa-arrow-left-long::before {
  content: "\f177"; }

.fa-long-arrow-left::before {
  content: "\f177"; }

.fa-plug-circle-check::before {
  content: "\e55c"; }

.fa-street-view::before {
  content: "\f21d"; }

.fa-franc-sign::before {
  content: "\e18f"; }

.fa-volume-off::before {
  content: "\f026"; }

.fa-hands-asl-interpreting::before {
  content: "\f2a3"; }

.fa-american-sign-language-interpreting::before {
  content: "\f2a3"; }

.fa-asl-interpreting::before {
  content: "\f2a3"; }

.fa-hands-american-sign-language-interpreting::before {
  content: "\f2a3"; }

.fa-gear::before {
  content: "\f013"; }

.fa-cog::before {
  content: "\f013"; }

.fa-droplet-slash::before {
  content: "\f5c7"; }

.fa-tint-slash::before {
  content: "\f5c7"; }

.fa-mosque::before {
  content: "\f678"; }

.fa-mosquito::before {
  content: "\e52b"; }

.fa-star-of-david::before {
  content: "\f69a"; }

.fa-person-military-rifle::before {
  content: "\e54b"; }

.fa-cart-shopping::before {
  content: "\f07a"; }

.fa-shopping-cart::before {
  content: "\f07a"; }

.fa-vials::before {
  content: "\f493"; }

.fa-plug-circle-plus::before {
  content: "\e55f"; }

.fa-place-of-worship::before {
  content: "\f67f"; }

.fa-grip-vertical::before {
  content: "\f58e"; }

.fa-arrow-turn-up::before {
  content: "\f148"; }

.fa-level-up::before {
  content: "\f148"; }

.fa-u::before {
  content: "\55"; }

.fa-square-root-variable::before {
  content: "\f698"; }

.fa-square-root-alt::before {
  content: "\f698"; }

.fa-clock::before {
  content: "\f017"; }

.fa-clock-four::before {
  content: "\f017"; }

.fa-backward-step::before {
  content: "\f048"; }

.fa-step-backward::before {
  content: "\f048"; }

.fa-pallet::before {
  content: "\f482"; }

.fa-faucet::before {
  content: "\e005"; }

.fa-baseball-bat-ball::before {
  content: "\f432"; }

.fa-s::before {
  content: "\53"; }

.fa-timeline::before {
  content: "\e29c"; }

.fa-keyboard::before {
  content: "\f11c"; }

.fa-caret-down::before {
  content: "\f0d7"; }

.fa-house-chimney-medical::before {
  content: "\f7f2"; }

.fa-clinic-medical::before {
  content: "\f7f2"; }

.fa-temperature-three-quarters::before {
  content: "\f2c8"; }

.fa-temperature-3::before {
  content: "\f2c8"; }

.fa-thermometer-3::before {
  content: "\f2c8"; }

.fa-thermometer-three-quarters::before {
  content: "\f2c8"; }

.fa-mobile-screen::before {
  content: "\f3cf"; }

.fa-mobile-android-alt::before {
  content: "\f3cf"; }

.fa-plane-up::before {
  content: "\e22d"; }

.fa-piggy-bank::before {
  content: "\f4d3"; }

.fa-battery-half::before {
  content: "\f242"; }

.fa-battery-3::before {
  content: "\f242"; }

.fa-mountain-city::before {
  content: "\e52e"; }

.fa-coins::before {
  content: "\f51e"; }

.fa-khanda::before {
  content: "\f66d"; }

.fa-sliders::before {
  content: "\f1de"; }

.fa-sliders-h::before {
  content: "\f1de"; }

.fa-folder-tree::before {
  content: "\f802"; }

.fa-network-wired::before {
  content: "\f6ff"; }

.fa-map-pin::before {
  content: "\f276"; }

.fa-hamsa::before {
  content: "\f665"; }

.fa-cent-sign::before {
  content: "\e3f5"; }

.fa-flask::before {
  content: "\f0c3"; }

.fa-person-pregnant::before {
  content: "\e31e"; }

.fa-wand-sparkles::before {
  content: "\f72b"; }

.fa-ellipsis-vertical::before {
  content: "\f142"; }

.fa-ellipsis-v::before {
  content: "\f142"; }

.fa-ticket::before {
  content: "\f145"; }

.fa-power-off::before {
  content: "\f011"; }

.fa-right-long::before {
  content: "\f30b"; }

.fa-long-arrow-alt-right::before {
  content: "\f30b"; }

.fa-flag-usa::before {
  content: "\f74d"; }

.fa-laptop-file::before {
  content: "\e51d"; }

.fa-tty::before {
  content: "\f1e4"; }

.fa-teletype::before {
  content: "\f1e4"; }

.fa-diagram-next::before {
  content: "\e476"; }

.fa-person-rifle::before {
  content: "\e54e"; }

.fa-house-medical-circle-exclamation::before {
  content: "\e512"; }

.fa-closed-captioning::before {
  content: "\f20a"; }

.fa-person-hiking::before {
  content: "\f6ec"; }

.fa-hiking::before {
  content: "\f6ec"; }

.fa-venus-double::before {
  content: "\f226"; }

.fa-images::before {
  content: "\f302"; }

.fa-calculator::before {
  content: "\f1ec"; }

.fa-people-pulling::before {
  content: "\e535"; }

.fa-n::before {
  content: "\4e"; }

.fa-cable-car::before {
  content: "\f7da"; }

.fa-tram::before {
  content: "\f7da"; }

.fa-cloud-rain::before {
  content: "\f73d"; }

.fa-building-circle-xmark::before {
  content: "\e4d4"; }

.fa-ship::before {
  content: "\f21a"; }

.fa-arrows-down-to-line::before {
  content: "\e4b8"; }

.fa-download::before {
  content: "\f019"; }

.fa-face-grin::before {
  content: "\f580"; }

.fa-grin::before {
  content: "\f580"; }

.fa-delete-left::before {
  content: "\f55a"; }

.fa-backspace::before {
  content: "\f55a"; }

.fa-eye-dropper::before {
  content: "\f1fb"; }

.fa-eye-dropper-empty::before {
  content: "\f1fb"; }

.fa-eyedropper::before {
  content: "\f1fb"; }

.fa-file-circle-check::before {
  content: "\e5a0"; }

.fa-forward::before {
  content: "\f04e"; }

.fa-mobile::before {
  content: "\f3ce"; }

.fa-mobile-android::before {
  content: "\f3ce"; }

.fa-mobile-phone::before {
  content: "\f3ce"; }

.fa-face-meh::before {
  content: "\f11a"; }

.fa-meh::before {
  content: "\f11a"; }

.fa-align-center::before {
  content: "\f037"; }

.fa-book-skull::before {
  content: "\f6b7"; }

.fa-book-dead::before {
  content: "\f6b7"; }

.fa-id-card::before {
  content: "\f2c2"; }

.fa-drivers-license::before {
  content: "\f2c2"; }

.fa-outdent::before {
  content: "\f03b"; }

.fa-dedent::before {
  content: "\f03b"; }

.fa-heart-circle-exclamation::before {
  content: "\e4fe"; }

.fa-house::before {
  content: "\f015"; }

.fa-home::before {
  content: "\f015"; }

.fa-home-alt::before {
  content: "\f015"; }

.fa-home-lg-alt::before {
  content: "\f015"; }

.fa-calendar-week::before {
  content: "\f784"; }

.fa-laptop-medical::before {
  content: "\f812"; }

.fa-b::before {
  content: "\42"; }

.fa-file-medical::before {
  content: "\f477"; }

.fa-dice-one::before {
  content: "\f525"; }

.fa-kiwi-bird::before {
  content: "\f535"; }

.fa-arrow-right-arrow-left::before {
  content: "\f0ec"; }

.fa-exchange::before {
  content: "\f0ec"; }

.fa-rotate-right::before {
  content: "\f2f9"; }

.fa-redo-alt::before {
  content: "\f2f9"; }

.fa-rotate-forward::before {
  content: "\f2f9"; }

.fa-utensils::before {
  content: "\f2e7"; }

.fa-cutlery::before {
  content: "\f2e7"; }

.fa-arrow-up-wide-short::before {
  content: "\f161"; }

.fa-sort-amount-up::before {
  content: "\f161"; }

.fa-mill-sign::before {
  content: "\e1ed"; }

.fa-bowl-rice::before {
  content: "\e2eb"; }

.fa-skull::before {
  content: "\f54c"; }

.fa-tower-broadcast::before {
  content: "\f519"; }

.fa-broadcast-tower::before {
  content: "\f519"; }

.fa-truck-pickup::before {
  content: "\f63c"; }

.fa-up-long::before {
  content: "\f30c"; }

.fa-long-arrow-alt-up::before {
  content: "\f30c"; }

.fa-stop::before {
  content: "\f04d"; }

.fa-code-merge::before {
  content: "\f387"; }

.fa-upload::before {
  content: "\f093"; }

.fa-hurricane::before {
  content: "\f751"; }

.fa-mound::before {
  content: "\e52d"; }

.fa-toilet-portable::before {
  content: "\e583"; }

.fa-compact-disc::before {
  content: "\f51f"; }

.fa-file-arrow-down::before {
  content: "\f56d"; }

.fa-file-download::before {
  content: "\f56d"; }

.fa-caravan::before {
  content: "\f8ff"; }

.fa-shield-cat::before {
  content: "\e572"; }

.fa-bolt::before {
  content: "\f0e7"; }

.fa-zap::before {
  content: "\f0e7"; }

.fa-glass-water::before {
  content: "\e4f4"; }

.fa-oil-well::before {
  content: "\e532"; }

.fa-vault::before {
  content: "\e2c5"; }

.fa-mars::before {
  content: "\f222"; }

.fa-toilet::before {
  content: "\f7d8"; }

.fa-plane-circle-xmark::before {
  content: "\e557"; }

.fa-yen-sign::before {
  content: "\f157"; }

.fa-cny::before {
  content: "\f157"; }

.fa-jpy::before {
  content: "\f157"; }

.fa-rmb::before {
  content: "\f157"; }

.fa-yen::before {
  content: "\f157"; }

.fa-ruble-sign::before {
  content: "\f158"; }

.fa-rouble::before {
  content: "\f158"; }

.fa-rub::before {
  content: "\f158"; }

.fa-ruble::before {
  content: "\f158"; }

.fa-sun::before {
  content: "\f185"; }

.fa-guitar::before {
  content: "\f7a6"; }

.fa-face-laugh-wink::before {
  content: "\f59c"; }

.fa-laugh-wink::before {
  content: "\f59c"; }

.fa-horse-head::before {
  content: "\f7ab"; }

.fa-bore-hole::before {
  content: "\e4c3"; }

.fa-industry::before {
  content: "\f275"; }

.fa-circle-down::before {
  content: "\f358"; }

.fa-arrow-alt-circle-down::before {
  content: "\f358"; }

.fa-arrows-turn-to-dots::before {
  content: "\e4c1"; }

.fa-florin-sign::before {
  content: "\e184"; }

.fa-arrow-down-short-wide::before {
  content: "\f884"; }

.fa-sort-amount-desc::before {
  content: "\f884"; }

.fa-sort-amount-down-alt::before {
  content: "\f884"; }

.fa-less-than::before {
  content: "\3c"; }

.fa-angle-down::before {
  content: "\f107"; }

.fa-car-tunnel::before {
  content: "\e4de"; }

.fa-head-side-cough::before {
  content: "\e061"; }

.fa-grip-lines::before {
  content: "\f7a4"; }

.fa-thumbs-down::before {
  content: "\f165"; }

.fa-user-lock::before {
  content: "\f502"; }

.fa-arrow-right-long::before {
  content: "\f178"; }

.fa-long-arrow-right::before {
  content: "\f178"; }

.fa-anchor-circle-xmark::before {
  content: "\e4ac"; }

.fa-ellipsis::before {
  content: "\f141"; }

.fa-ellipsis-h::before {
  content: "\f141"; }

.fa-chess-pawn::before {
  content: "\f443"; }

.fa-kit-medical::before {
  content: "\f479"; }

.fa-first-aid::before {
  content: "\f479"; }

.fa-person-through-window::before {
  content: "\e5a9"; }

.fa-toolbox::before {
  content: "\f552"; }

.fa-hands-holding-circle::before {
  content: "\e4fb"; }

.fa-bug::before {
  content: "\f188"; }

.fa-credit-card::before {
  content: "\f09d"; }

.fa-credit-card-alt::before {
  content: "\f09d"; }

.fa-car::before {
  content: "\f1b9"; }

.fa-automobile::before {
  content: "\f1b9"; }

.fa-hand-holding-hand::before {
  content: "\e4f7"; }

.fa-book-open-reader::before {
  content: "\f5da"; }

.fa-book-reader::before {
  content: "\f5da"; }

.fa-mountain-sun::before {
  content: "\e52f"; }

.fa-arrows-left-right-to-line::before {
  content: "\e4ba"; }

.fa-dice-d20::before {
  content: "\f6cf"; }

.fa-truck-droplet::before {
  content: "\e58c"; }

.fa-file-circle-xmark::before {
  content: "\e5a1"; }

.fa-temperature-arrow-up::before {
  content: "\e040"; }

.fa-temperature-up::before {
  content: "\e040"; }

.fa-medal::before {
  content: "\f5a2"; }

.fa-bed::before {
  content: "\f236"; }

.fa-square-h::before {
  content: "\f0fd"; }

.fa-h-square::before {
  content: "\f0fd"; }

.fa-podcast::before {
  content: "\f2ce"; }

.fa-temperature-full::before {
  content: "\f2c7"; }

.fa-temperature-4::before {
  content: "\f2c7"; }

.fa-thermometer-4::before {
  content: "\f2c7"; }

.fa-thermometer-full::before {
  content: "\f2c7"; }

.fa-bell::before {
  content: "\f0f3"; }

.fa-superscript::before {
  content: "\f12b"; }

.fa-plug-circle-xmark::before {
  content: "\e560"; }

.fa-star-of-life::before {
  content: "\f621"; }

.fa-phone-slash::before {
  content: "\f3dd"; }

.fa-paint-roller::before {
  content: "\f5aa"; }

.fa-handshake-angle::before {
  content: "\f4c4"; }

.fa-hands-helping::before {
  content: "\f4c4"; }

.fa-location-dot::before {
  content: "\f3c5"; }

.fa-map-marker-alt::before {
  content: "\f3c5"; }

.fa-file::before {
  content: "\f15b"; }

.fa-greater-than::before {
  content: "\3e"; }

.fa-person-swimming::before {
  content: "\f5c4"; }

.fa-swimmer::before {
  content: "\f5c4"; }

.fa-arrow-down::before {
  content: "\f063"; }

.fa-droplet::before {
  content: "\f043"; }

.fa-tint::before {
  content: "\f043"; }

.fa-eraser::before {
  content: "\f12d"; }

.fa-earth-americas::before {
  content: "\f57d"; }

.fa-earth::before {
  content: "\f57d"; }

.fa-earth-america::before {
  content: "\f57d"; }

.fa-globe-americas::before {
  content: "\f57d"; }

.fa-person-burst::before {
  content: "\e53b"; }

.fa-dove::before {
  content: "\f4ba"; }

.fa-battery-empty::before {
  content: "\f244"; }

.fa-battery-0::before {
  content: "\f244"; }

.fa-socks::before {
  content: "\f696"; }

.fa-inbox::before {
  content: "\f01c"; }

.fa-section::before {
  content: "\e447"; }

.fa-gauge-high::before {
  content: "\f625"; }

.fa-tachometer-alt::before {
  content: "\f625"; }

.fa-tachometer-alt-fast::before {
  content: "\f625"; }

.fa-envelope-open-text::before {
  content: "\f658"; }

.fa-hospital::before {
  content: "\f0f8"; }

.fa-hospital-alt::before {
  content: "\f0f8"; }

.fa-hospital-wide::before {
  content: "\f0f8"; }

.fa-wine-bottle::before {
  content: "\f72f"; }

.fa-chess-rook::before {
  content: "\f447"; }

.fa-bars-staggered::before {
  content: "\f550"; }

.fa-reorder::before {
  content: "\f550"; }

.fa-stream::before {
  content: "\f550"; }

.fa-dharmachakra::before {
  content: "\f655"; }

.fa-hotdog::before {
  content: "\f80f"; }

.fa-person-walking-with-cane::before {
  content: "\f29d"; }

.fa-blind::before {
  content: "\f29d"; }

.fa-drum::before {
  content: "\f569"; }

.fa-ice-cream::before {
  content: "\f810"; }

.fa-heart-circle-bolt::before {
  content: "\e4fc"; }

.fa-fax::before {
  content: "\f1ac"; }

.fa-paragraph::before {
  content: "\f1dd"; }

.fa-check-to-slot::before {
  content: "\f772"; }

.fa-vote-yea::before {
  content: "\f772"; }

.fa-star-half::before {
  content: "\f089"; }

.fa-boxes-stacked::before {
  content: "\f468"; }

.fa-boxes::before {
  content: "\f468"; }

.fa-boxes-alt::before {
  content: "\f468"; }

.fa-link::before {
  content: "\f0c1"; }

.fa-chain::before {
  content: "\f0c1"; }

.fa-ear-listen::before {
  content: "\f2a2"; }

.fa-assistive-listening-systems::before {
  content: "\f2a2"; }

.fa-tree-city::before {
  content: "\e587"; }

.fa-play::before {
  content: "\f04b"; }

.fa-font::before {
  content: "\f031"; }

.fa-rupiah-sign::before {
  content: "\e23d"; }

.fa-magnifying-glass::before {
  content: "\f002"; }

.fa-search::before {
  content: "\f002"; }

.fa-table-tennis-paddle-ball::before {
  content: "\f45d"; }

.fa-ping-pong-paddle-ball::before {
  content: "\f45d"; }

.fa-table-tennis::before {
  content: "\f45d"; }

.fa-person-dots-from-line::before {
  content: "\f470"; }

.fa-diagnoses::before {
  content: "\f470"; }

.fa-trash-can-arrow-up::before {
  content: "\f82a"; }

.fa-trash-restore-alt::before {
  content: "\f82a"; }

.fa-naira-sign::before {
  content: "\e1f6"; }

.fa-cart-arrow-down::before {
  content: "\f218"; }

.fa-walkie-talkie::before {
  content: "\f8ef"; }

.fa-file-pen::before {
  content: "\f31c"; }

.fa-file-edit::before {
  content: "\f31c"; }

.fa-receipt::before {
  content: "\f543"; }

.fa-square-pen::before {
  content: "\f14b"; }

.fa-pen-square::before {
  content: "\f14b"; }

.fa-pencil-square::before {
  content: "\f14b"; }

.fa-suitcase-rolling::before {
  content: "\f5c1"; }

.fa-person-circle-exclamation::before {
  content: "\e53f"; }

.fa-chevron-down::before {
  content: "\f078"; }

.fa-battery-full::before {
  content: "\f240"; }

.fa-battery::before {
  content: "\f240"; }

.fa-battery-5::before {
  content: "\f240"; }

.fa-skull-crossbones::before {
  content: "\f714"; }

.fa-code-compare::before {
  content: "\e13a"; }

.fa-list-ul::before {
  content: "\f0ca"; }

.fa-list-dots::before {
  content: "\f0ca"; }

.fa-school-lock::before {
  content: "\e56f"; }

.fa-tower-cell::before {
  content: "\e585"; }

.fa-down-long::before {
  content: "\f309"; }

.fa-long-arrow-alt-down::before {
  content: "\f309"; }

.fa-ranking-star::before {
  content: "\e561"; }

.fa-chess-king::before {
  content: "\f43f"; }

.fa-person-harassing::before {
  content: "\e549"; }

.fa-brazilian-real-sign::before {
  content: "\e46c"; }

.fa-landmark-dome::before {
  content: "\f752"; }

.fa-landmark-alt::before {
  content: "\f752"; }

.fa-arrow-up::before {
  content: "\f062"; }

.fa-tv::before {
  content: "\f26c"; }

.fa-television::before {
  content: "\f26c"; }

.fa-tv-alt::before {
  content: "\f26c"; }

.fa-shrimp::before {
  content: "\e448"; }

.fa-list-check::before {
  content: "\f0ae"; }

.fa-tasks::before {
  content: "\f0ae"; }

.fa-jug-detergent::before {
  content: "\e519"; }

.fa-circle-user::before {
  content: "\f2bd"; }

.fa-user-circle::before {
  content: "\f2bd"; }

.fa-user-shield::before {
  content: "\f505"; }

.fa-wind::before {
  content: "\f72e"; }

.fa-car-burst::before {
  content: "\f5e1"; }

.fa-car-crash::before {
  content: "\f5e1"; }

.fa-y::before {
  content: "\59"; }

.fa-person-snowboarding::before {
  content: "\f7ce"; }

.fa-snowboarding::before {
  content: "\f7ce"; }

.fa-truck-fast::before {
  content: "\f48b"; }

.fa-shipping-fast::before {
  content: "\f48b"; }

.fa-fish::before {
  content: "\f578"; }

.fa-user-graduate::before {
  content: "\f501"; }

.fa-circle-half-stroke::before {
  content: "\f042"; }

.fa-adjust::before {
  content: "\f042"; }

.fa-clapperboard::before {
  content: "\e131"; }

.fa-circle-radiation::before {
  content: "\f7ba"; }

.fa-radiation-alt::before {
  content: "\f7ba"; }

.fa-baseball::before {
  content: "\f433"; }

.fa-baseball-ball::before {
  content: "\f433"; }

.fa-jet-fighter-up::before {
  content: "\e518"; }

.fa-diagram-project::before {
  content: "\f542"; }

.fa-project-diagram::before {
  content: "\f542"; }

.fa-copy::before {
  content: "\f0c5"; }

.fa-volume-xmark::before {
  content: "\f6a9"; }

.fa-volume-mute::before {
  content: "\f6a9"; }

.fa-volume-times::before {
  content: "\f6a9"; }

.fa-hand-sparkles::before {
  content: "\e05d"; }

.fa-grip::before {
  content: "\f58d"; }

.fa-grip-horizontal::before {
  content: "\f58d"; }

.fa-share-from-square::before {
  content: "\f14d"; }

.fa-share-square::before {
  content: "\f14d"; }

.fa-child-combatant::before {
  content: "\e4e0"; }

.fa-child-rifle::before {
  content: "\e4e0"; }

.fa-gun::before {
  content: "\e19b"; }

.fa-square-phone::before {
  content: "\f098"; }

.fa-phone-square::before {
  content: "\f098"; }

.fa-plus::before {
  content: "\2b"; }

.fa-add::before {
  content: "\2b"; }

.fa-expand::before {
  content: "\f065"; }

.fa-computer::before {
  content: "\e4e5"; }

.fa-xmark::before {
  content: "\f00d"; }

.fa-close::before {
  content: "\f00d"; }

.fa-multiply::before {
  content: "\f00d"; }

.fa-remove::before {
  content: "\f00d"; }

.fa-times::before {
  content: "\f00d"; }

.fa-arrows-up-down-left-right::before {
  content: "\f047"; }

.fa-arrows::before {
  content: "\f047"; }

.fa-chalkboard-user::before {
  content: "\f51c"; }

.fa-chalkboard-teacher::before {
  content: "\f51c"; }

.fa-peso-sign::before {
  content: "\e222"; }

.fa-building-shield::before {
  content: "\e4d8"; }

.fa-baby::before {
  content: "\f77c"; }

.fa-users-line::before {
  content: "\e592"; }

.fa-quote-left::before {
  content: "\f10d"; }

.fa-quote-left-alt::before {
  content: "\f10d"; }

.fa-tractor::before {
  content: "\f722"; }

.fa-trash-arrow-up::before {
  content: "\f829"; }

.fa-trash-restore::before {
  content: "\f829"; }

.fa-arrow-down-up-lock::before {
  content: "\e4b0"; }

.fa-lines-leaning::before {
  content: "\e51e"; }

.fa-ruler-combined::before {
  content: "\f546"; }

.fa-copyright::before {
  content: "\f1f9"; }

.fa-equals::before {
  content: "\3d"; }

.fa-blender::before {
  content: "\f517"; }

.fa-teeth::before {
  content: "\f62e"; }

.fa-shekel-sign::before {
  content: "\f20b"; }

.fa-ils::before {
  content: "\f20b"; }

.fa-shekel::before {
  content: "\f20b"; }

.fa-sheqel::before {
  content: "\f20b"; }

.fa-sheqel-sign::before {
  content: "\f20b"; }

.fa-map::before {
  content: "\f279"; }

.fa-rocket::before {
  content: "\f135"; }

.fa-photo-film::before {
  content: "\f87c"; }

.fa-photo-video::before {
  content: "\f87c"; }

.fa-folder-minus::before {
  content: "\f65d"; }

.fa-store::before {
  content: "\f54e"; }

.fa-arrow-trend-up::before {
  content: "\e098"; }

.fa-plug-circle-minus::before {
  content: "\e55e"; }

.fa-sign-hanging::before {
  content: "\f4d9"; }

.fa-sign::before {
  content: "\f4d9"; }

.fa-bezier-curve::before {
  content: "\f55b"; }

.fa-bell-slash::before {
  content: "\f1f6"; }

.fa-tablet::before {
  content: "\f3fb"; }

.fa-tablet-android::before {
  content: "\f3fb"; }

.fa-school-flag::before {
  content: "\e56e"; }

.fa-fill::before {
  content: "\f575"; }

.fa-angle-up::before {
  content: "\f106"; }

.fa-drumstick-bite::before {
  content: "\f6d7"; }

.fa-holly-berry::before {
  content: "\f7aa"; }

.fa-chevron-left::before {
  content: "\f053"; }

.fa-bacteria::before {
  content: "\e059"; }

.fa-hand-lizard::before {
  content: "\f258"; }

.fa-notdef::before {
  content: "\e1fe"; }

.fa-disease::before {
  content: "\f7fa"; }

.fa-briefcase-medical::before {
  content: "\f469"; }

.fa-genderless::before {
  content: "\f22d"; }

.fa-chevron-right::before {
  content: "\f054"; }

.fa-retweet::before {
  content: "\f079"; }

.fa-car-rear::before {
  content: "\f5de"; }

.fa-car-alt::before {
  content: "\f5de"; }

.fa-pump-soap::before {
  content: "\e06b"; }

.fa-video-slash::before {
  content: "\f4e2"; }

.fa-battery-quarter::before {
  content: "\f243"; }

.fa-battery-2::before {
  content: "\f243"; }

.fa-radio::before {
  content: "\f8d7"; }

.fa-baby-carriage::before {
  content: "\f77d"; }

.fa-carriage-baby::before {
  content: "\f77d"; }

.fa-traffic-light::before {
  content: "\f637"; }

.fa-thermometer::before {
  content: "\f491"; }

.fa-vr-cardboard::before {
  content: "\f729"; }

.fa-hand-middle-finger::before {
  content: "\f806"; }

.fa-percent::before {
  content: "\25"; }

.fa-percentage::before {
  content: "\25"; }

.fa-truck-moving::before {
  content: "\f4df"; }

.fa-glass-water-droplet::before {
  content: "\e4f5"; }

.fa-display::before {
  content: "\e163"; }

.fa-face-smile::before {
  content: "\f118"; }

.fa-smile::before {
  content: "\f118"; }

.fa-thumbtack::before {
  content: "\f08d"; }

.fa-thumb-tack::before {
  content: "\f08d"; }

.fa-trophy::before {
  content: "\f091"; }

.fa-person-praying::before {
  content: "\f683"; }

.fa-pray::before {
  content: "\f683"; }

.fa-hammer::before {
  content: "\f6e3"; }

.fa-hand-peace::before {
  content: "\f25b"; }

.fa-rotate::before {
  content: "\f2f1"; }

.fa-sync-alt::before {
  content: "\f2f1"; }

.fa-spinner::before {
  content: "\f110"; }

.fa-robot::before {
  content: "\f544"; }

.fa-peace::before {
  content: "\f67c"; }

.fa-gears::before {
  content: "\f085"; }

.fa-cogs::before {
  content: "\f085"; }

.fa-warehouse::before {
  content: "\f494"; }

.fa-arrow-up-right-dots::before {
  content: "\e4b7"; }

.fa-splotch::before {
  content: "\f5bc"; }

.fa-face-grin-hearts::before {
  content: "\f584"; }

.fa-grin-hearts::before {
  content: "\f584"; }

.fa-dice-four::before {
  content: "\f524"; }

.fa-sim-card::before {
  content: "\f7c4"; }

.fa-transgender::before {
  content: "\f225"; }

.fa-transgender-alt::before {
  content: "\f225"; }

.fa-mercury::before {
  content: "\f223"; }

.fa-arrow-turn-down::before {
  content: "\f149"; }

.fa-level-down::before {
  content: "\f149"; }

.fa-person-falling-burst::before {
  content: "\e547"; }

.fa-award::before {
  content: "\f559"; }

.fa-ticket-simple::before {
  content: "\f3ff"; }

.fa-ticket-alt::before {
  content: "\f3ff"; }

.fa-building::before {
  content: "\f1ad"; }

.fa-angles-left::before {
  content: "\f100"; }

.fa-angle-double-left::before {
  content: "\f100"; }

.fa-qrcode::before {
  content: "\f029"; }

.fa-clock-rotate-left::before {
  content: "\f1da"; }

.fa-history::before {
  content: "\f1da"; }

.fa-face-grin-beam-sweat::before {
  content: "\f583"; }

.fa-grin-beam-sweat::before {
  content: "\f583"; }

.fa-file-export::before {
  content: "\f56e"; }

.fa-arrow-right-from-file::before {
  content: "\f56e"; }

.fa-shield::before {
  content: "\f132"; }

.fa-shield-blank::before {
  content: "\f132"; }

.fa-arrow-up-short-wide::before {
  content: "\f885"; }

.fa-sort-amount-up-alt::before {
  content: "\f885"; }

.fa-house-medical::before {
  content: "\e3b2"; }

.fa-golf-ball-tee::before {
  content: "\f450"; }

.fa-golf-ball::before {
  content: "\f450"; }

.fa-circle-chevron-left::before {
  content: "\f137"; }

.fa-chevron-circle-left::before {
  content: "\f137"; }

.fa-house-chimney-window::before {
  content: "\e00d"; }

.fa-pen-nib::before {
  content: "\f5ad"; }

.fa-tent-arrow-turn-left::before {
  content: "\e580"; }

.fa-tents::before {
  content: "\e582"; }

.fa-wand-magic::before {
  content: "\f0d0"; }

.fa-magic::before {
  content: "\f0d0"; }

.fa-dog::before {
  content: "\f6d3"; }

.fa-carrot::before {
  content: "\f787"; }

.fa-moon::before {
  content: "\f186"; }

.fa-wine-glass-empty::before {
  content: "\f5ce"; }

.fa-wine-glass-alt::before {
  content: "\f5ce"; }

.fa-cheese::before {
  content: "\f7ef"; }

.fa-yin-yang::before {
  content: "\f6ad"; }

.fa-music::before {
  content: "\f001"; }

.fa-code-commit::before {
  content: "\f386"; }

.fa-temperature-low::before {
  content: "\f76b"; }

.fa-person-biking::before {
  content: "\f84a"; }

.fa-biking::before {
  content: "\f84a"; }

.fa-broom::before {
  content: "\f51a"; }

.fa-shield-heart::before {
  content: "\e574"; }

.fa-gopuram::before {
  content: "\f664"; }

.fa-earth-oceania::before {
  content: "\e47b"; }

.fa-globe-oceania::before {
  content: "\e47b"; }

.fa-square-xmark::before {
  content: "\f2d3"; }

.fa-times-square::before {
  content: "\f2d3"; }

.fa-xmark-square::before {
  content: "\f2d3"; }

.fa-hashtag::before {
  content: "\23"; }

.fa-up-right-and-down-left-from-center::before {
  content: "\f424"; }

.fa-expand-alt::before {
  content: "\f424"; }

.fa-oil-can::before {
  content: "\f613"; }

.fa-t::before {
  content: "\54"; }

.fa-hippo::before {
  content: "\f6ed"; }

.fa-chart-column::before {
  content: "\e0e3"; }

.fa-infinity::before {
  content: "\f534"; }

.fa-vial-circle-check::before {
  content: "\e596"; }

.fa-person-arrow-down-to-line::before {
  content: "\e538"; }

.fa-voicemail::before {
  content: "\f897"; }

.fa-fan::before {
  content: "\f863"; }

.fa-person-walking-luggage::before {
  content: "\e554"; }

.fa-up-down::before {
  content: "\f338"; }

.fa-arrows-alt-v::before {
  content: "\f338"; }

.fa-cloud-moon-rain::before {
  content: "\f73c"; }

.fa-calendar::before {
  content: "\f133"; }

.fa-trailer::before {
  content: "\e041"; }

.fa-bahai::before {
  content: "\f666"; }

.fa-haykal::before {
  content: "\f666"; }

.fa-sd-card::before {
  content: "\f7c2"; }

.fa-dragon::before {
  content: "\f6d5"; }

.fa-shoe-prints::before {
  content: "\f54b"; }

.fa-circle-plus::before {
  content: "\f055"; }

.fa-plus-circle::before {
  content: "\f055"; }

.fa-face-grin-tongue-wink::before {
  content: "\f58b"; }

.fa-grin-tongue-wink::before {
  content: "\f58b"; }

.fa-hand-holding::before {
  content: "\f4bd"; }

.fa-plug-circle-exclamation::before {
  content: "\e55d"; }

.fa-link-slash::before {
  content: "\f127"; }

.fa-chain-broken::before {
  content: "\f127"; }

.fa-chain-slash::before {
  content: "\f127"; }

.fa-unlink::before {
  content: "\f127"; }

.fa-clone::before {
  content: "\f24d"; }

.fa-person-walking-arrow-loop-left::before {
  content: "\e551"; }

.fa-arrow-up-z-a::before {
  content: "\f882"; }

.fa-sort-alpha-up-alt::before {
  content: "\f882"; }

.fa-fire-flame-curved::before {
  content: "\f7e4"; }

.fa-fire-alt::before {
  content: "\f7e4"; }

.fa-tornado::before {
  content: "\f76f"; }

.fa-file-circle-plus::before {
  content: "\e494"; }

.fa-book-quran::before {
  content: "\f687"; }

.fa-quran::before {
  content: "\f687"; }

.fa-anchor::before {
  content: "\f13d"; }

.fa-border-all::before {
  content: "\f84c"; }

.fa-face-angry::before {
  content: "\f556"; }

.fa-angry::before {
  content: "\f556"; }

.fa-cookie-bite::before {
  content: "\f564"; }

.fa-arrow-trend-down::before {
  content: "\e097"; }

.fa-rss::before {
  content: "\f09e"; }

.fa-feed::before {
  content: "\f09e"; }

.fa-draw-polygon::before {
  content: "\f5ee"; }

.fa-scale-balanced::before {
  content: "\f24e"; }

.fa-balance-scale::before {
  content: "\f24e"; }

.fa-gauge-simple-high::before {
  content: "\f62a"; }

.fa-tachometer::before {
  content: "\f62a"; }

.fa-tachometer-fast::before {
  content: "\f62a"; }

.fa-shower::before {
  content: "\f2cc"; }

.fa-desktop::before {
  content: "\f390"; }

.fa-desktop-alt::before {
  content: "\f390"; }

.fa-m::before {
  content: "\4d"; }

.fa-table-list::before {
  content: "\f00b"; }

.fa-th-list::before {
  content: "\f00b"; }

.fa-comment-sms::before {
  content: "\f7cd"; }

.fa-sms::before {
  content: "\f7cd"; }

.fa-book::before {
  content: "\f02d"; }

.fa-user-plus::before {
  content: "\f234"; }

.fa-check::before {
  content: "\f00c"; }

.fa-battery-three-quarters::before {
  content: "\f241"; }

.fa-battery-4::before {
  content: "\f241"; }

.fa-house-circle-check::before {
  content: "\e509"; }

.fa-angle-left::before {
  content: "\f104"; }

.fa-diagram-successor::before {
  content: "\e47a"; }

.fa-truck-arrow-right::before {
  content: "\e58b"; }

.fa-arrows-split-up-and-left::before {
  content: "\e4bc"; }

.fa-hand-fist::before {
  content: "\f6de"; }

.fa-fist-raised::before {
  content: "\f6de"; }

.fa-cloud-moon::before {
  content: "\f6c3"; }

.fa-briefcase::before {
  content: "\f0b1"; }

.fa-person-falling::before {
  content: "\e546"; }

.fa-image-portrait::before {
  content: "\f3e0"; }

.fa-portrait::before {
  content: "\f3e0"; }

.fa-user-tag::before {
  content: "\f507"; }

.fa-rug::before {
  content: "\e569"; }

.fa-earth-europe::before {
  content: "\f7a2"; }

.fa-globe-europe::before {
  content: "\f7a2"; }

.fa-cart-flatbed-suitcase::before {
  content: "\f59d"; }

.fa-luggage-cart::before {
  content: "\f59d"; }

.fa-rectangle-xmark::before {
  content: "\f410"; }

.fa-rectangle-times::before {
  content: "\f410"; }

.fa-times-rectangle::before {
  content: "\f410"; }

.fa-window-close::before {
  content: "\f410"; }

.fa-baht-sign::before {
  content: "\e0ac"; }

.fa-book-open::before {
  content: "\f518"; }

.fa-book-journal-whills::before {
  content: "\f66a"; }

.fa-journal-whills::before {
  content: "\f66a"; }

.fa-handcuffs::before {
  content: "\e4f8"; }

.fa-triangle-exclamation::before {
  content: "\f071"; }

.fa-exclamation-triangle::before {
  content: "\f071"; }

.fa-warning::before {
  content: "\f071"; }

.fa-database::before {
  content: "\f1c0"; }

.fa-share::before {
  content: "\f064"; }

.fa-arrow-turn-right::before {
  content: "\f064"; }

.fa-mail-forward::before {
  content: "\f064"; }

.fa-bottle-droplet::before {
  content: "\e4c4"; }

.fa-mask-face::before {
  content: "\e1d7"; }

.fa-hill-rockslide::before {
  content: "\e508"; }

.fa-right-left::before {
  content: "\f362"; }

.fa-exchange-alt::before {
  content: "\f362"; }

.fa-paper-plane::before {
  content: "\f1d8"; }

.fa-road-circle-exclamation::before {
  content: "\e565"; }

.fa-dungeon::before {
  content: "\f6d9"; }

.fa-align-right::before {
  content: "\f038"; }

.fa-money-bill-1-wave::before {
  content: "\f53b"; }

.fa-money-bill-wave-alt::before {
  content: "\f53b"; }

.fa-life-ring::before {
  content: "\f1cd"; }

.fa-hands::before {
  content: "\f2a7"; }

.fa-sign-language::before {
  content: "\f2a7"; }

.fa-signing::before {
  content: "\f2a7"; }

.fa-calendar-day::before {
  content: "\f783"; }

.fa-water-ladder::before {
  content: "\f5c5"; }

.fa-ladder-water::before {
  content: "\f5c5"; }

.fa-swimming-pool::before {
  content: "\f5c5"; }

.fa-arrows-up-down::before {
  content: "\f07d"; }

.fa-arrows-v::before {
  content: "\f07d"; }

.fa-face-grimace::before {
  content: "\f57f"; }

.fa-grimace::before {
  content: "\f57f"; }

.fa-wheelchair-move::before {
  content: "\e2ce"; }

.fa-wheelchair-alt::before {
  content: "\e2ce"; }

.fa-turn-down::before {
  content: "\f3be"; }

.fa-level-down-alt::before {
  content: "\f3be"; }

.fa-person-walking-arrow-right::before {
  content: "\e552"; }

.fa-square-envelope::before {
  content: "\f199"; }

.fa-envelope-square::before {
  content: "\f199"; }

.fa-dice::before {
  content: "\f522"; }

.fa-bowling-ball::before {
  content: "\f436"; }

.fa-brain::before {
  content: "\f5dc"; }

.fa-bandage::before {
  content: "\f462"; }

.fa-band-aid::before {
  content: "\f462"; }

.fa-calendar-minus::before {
  content: "\f272"; }

.fa-circle-xmark::before {
  content: "\f057"; }

.fa-times-circle::before {
  content: "\f057"; }

.fa-xmark-circle::before {
  content: "\f057"; }

.fa-gifts::before {
  content: "\f79c"; }

.fa-hotel::before {
  content: "\f594"; }

.fa-earth-asia::before {
  content: "\f57e"; }

.fa-globe-asia::before {
  content: "\f57e"; }

.fa-id-card-clip::before {
  content: "\f47f"; }

.fa-id-card-alt::before {
  content: "\f47f"; }

.fa-magnifying-glass-plus::before {
  content: "\f00e"; }

.fa-search-plus::before {
  content: "\f00e"; }

.fa-thumbs-up::before {
  content: "\f164"; }

.fa-user-clock::before {
  content: "\f4fd"; }

.fa-hand-dots::before {
  content: "\f461"; }

.fa-allergies::before {
  content: "\f461"; }

.fa-file-invoice::before {
  content: "\f570"; }

.fa-window-minimize::before {
  content: "\f2d1"; }

.fa-mug-saucer::before {
  content: "\f0f4"; }

.fa-coffee::before {
  content: "\f0f4"; }

.fa-brush::before {
  content: "\f55d"; }

.fa-mask::before {
  content: "\f6fa"; }

.fa-magnifying-glass-minus::before {
  content: "\f010"; }

.fa-search-minus::before {
  content: "\f010"; }

.fa-ruler-vertical::before {
  content: "\f548"; }

.fa-user-large::before {
  content: "\f406"; }

.fa-user-alt::before {
  content: "\f406"; }

.fa-train-tram::before {
  content: "\e5b4"; }

.fa-user-nurse::before {
  content: "\f82f"; }

.fa-syringe::before {
  content: "\f48e"; }

.fa-cloud-sun::before {
  content: "\f6c4"; }

.fa-stopwatch-20::before {
  content: "\e06f"; }

.fa-square-full::before {
  content: "\f45c"; }

.fa-magnet::before {
  content: "\f076"; }

.fa-jar::before {
  content: "\e516"; }

.fa-note-sticky::before {
  content: "\f249"; }

.fa-sticky-note::before {
  content: "\f249"; }

.fa-bug-slash::before {
  content: "\e490"; }

.fa-arrow-up-from-water-pump::before {
  content: "\e4b6"; }

.fa-bone::before {
  content: "\f5d7"; }

.fa-user-injured::before {
  content: "\f728"; }

.fa-face-sad-tear::before {
  content: "\f5b4"; }

.fa-sad-tear::before {
  content: "\f5b4"; }

.fa-plane::before {
  content: "\f072"; }

.fa-tent-arrows-down::before {
  content: "\e581"; }

.fa-exclamation::before {
  content: "\21"; }

.fa-arrows-spin::before {
  content: "\e4bb"; }

.fa-print::before {
  content: "\f02f"; }

.fa-turkish-lira-sign::before {
  content: "\e2bb"; }

.fa-try::before {
  content: "\e2bb"; }

.fa-turkish-lira::before {
  content: "\e2bb"; }

.fa-dollar-sign::before {
  content: "\24"; }

.fa-dollar::before {
  content: "\24"; }

.fa-usd::before {
  content: "\24"; }

.fa-x::before {
  content: "\58"; }

.fa-magnifying-glass-dollar::before {
  content: "\f688"; }

.fa-search-dollar::before {
  content: "\f688"; }

.fa-users-gear::before {
  content: "\f509"; }

.fa-users-cog::before {
  content: "\f509"; }

.fa-person-military-pointing::before {
  content: "\e54a"; }

.fa-building-columns::before {
  content: "\f19c"; }

.fa-bank::before {
  content: "\f19c"; }

.fa-institution::before {
  content: "\f19c"; }

.fa-museum::before {
  content: "\f19c"; }

.fa-university::before {
  content: "\f19c"; }

.fa-umbrella::before {
  content: "\f0e9"; }

.fa-trowel::before {
  content: "\e589"; }

.fa-d::before {
  content: "\44"; }

.fa-stapler::before {
  content: "\e5af"; }

.fa-masks-theater::before {
  content: "\f630"; }

.fa-theater-masks::before {
  content: "\f630"; }

.fa-kip-sign::before {
  content: "\e1c4"; }

.fa-hand-point-left::before {
  content: "\f0a5"; }

.fa-handshake-simple::before {
  content: "\f4c6"; }

.fa-handshake-alt::before {
  content: "\f4c6"; }

.fa-jet-fighter::before {
  content: "\f0fb"; }

.fa-fighter-jet::before {
  content: "\f0fb"; }

.fa-square-share-nodes::before {
  content: "\f1e1"; }

.fa-share-alt-square::before {
  content: "\f1e1"; }

.fa-barcode::before {
  content: "\f02a"; }

.fa-plus-minus::before {
  content: "\e43c"; }

.fa-video::before {
  content: "\f03d"; }

.fa-video-camera::before {
  content: "\f03d"; }

.fa-graduation-cap::before {
  content: "\f19d"; }

.fa-mortar-board::before {
  content: "\f19d"; }

.fa-hand-holding-medical::before {
  content: "\e05c"; }

.fa-person-circle-check::before {
  content: "\e53e"; }

.fa-turn-up::before {
  content: "\f3bf"; }

.fa-level-up-alt::before {
  content: "\f3bf"; }

.sr-only,
.fa-sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0; }

.sr-only-focusable:not(:focus),
.fa-sr-only-focusable:not(:focus) {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0; }
:root, :host {
  --fa-style-family-brands: 'Font Awesome 6 Brands';
  --fa-font-brands: normal 400 1em/1 'Font Awesome 6 Brands'; }

@font-face {
  font-family: 'Font Awesome 6 Brands';
  font-style: normal;
  font-weight: 400;
  font-display: block;
  src: url("../webfonts/FontAwesome6Brands-Regular-400.woff2") format("woff2"), url("../webfonts/FontAwesome6Brands-Regular-400.ttf") format("truetype"); }

.fab,
.fa-brands {
  font-weight: 400; }

.fa-monero:before {
  content: "\f3d0"; }

.fa-hooli:before {
  content: "\f427"; }

.fa-yelp:before {
  content: "\f1e9"; }

.fa-cc-visa:before {
  content: "\f1f0"; }

.fa-lastfm:before {
  content: "\f202"; }

.fa-shopware:before {
  content: "\f5b5"; }

.fa-creative-commons-nc:before {
  content: "\f4e8"; }

.fa-aws:before {
  content: "\f375"; }

.fa-redhat:before {
  content: "\f7bc"; }

.fa-yoast:before {
  content: "\f2b1"; }

.fa-cloudflare:before {
  content: "\e07d"; }

.fa-ups:before {
  content: "\f7e0"; }

.fa-wpexplorer:before {
  content: "\f2de"; }

.fa-dyalog:before {
  content: "\f399"; }

.fa-bity:before {
  content: "\f37a"; }

.fa-stackpath:before {
  content: "\f842"; }

.fa-buysellads:before {
  content: "\f20d"; }

.fa-first-order:before {
  content: "\f2b0"; }

.fa-modx:before {
  content: "\f285"; }

.fa-guilded:before {
  content: "\e07e"; }

.fa-vnv:before {
  content: "\f40b"; }

.fa-square-js:before {
  content: "\f3b9"; }

.fa-js-square:before {
  content: "\f3b9"; }

.fa-microsoft:before {
  content: "\f3ca"; }

.fa-qq:before {
  content: "\f1d6"; }

.fa-orcid:before {
  content: "\f8d2"; }

.fa-java:before {
  content: "\f4e4"; }

.fa-invision:before {
  content: "\f7b0"; }

.fa-creative-commons-pd-alt:before {
  content: "\f4ed"; }

.fa-centercode:before {
  content: "\f380"; }

.fa-glide-g:before {
  content: "\f2a6"; }

.fa-drupal:before {
  content: "\f1a9"; }

.fa-hire-a-helper:before {
  content: "\f3b0"; }

.fa-creative-commons-by:before {
  content: "\f4e7"; }

.fa-unity:before {
  content: "\e049"; }

.fa-whmcs:before {
  content: "\f40d"; }

.fa-rocketchat:before {
  content: "\f3e8"; }

.fa-vk:before {
  content: "\f189"; }

.fa-untappd:before {
  content: "\f405"; }

.fa-mailchimp:before {
  content: "\f59e"; }

.fa-css3-alt:before {
  content: "\f38b"; }

.fa-square-reddit:before {
  content: "\f1a2"; }

.fa-reddit-square:before {
  content: "\f1a2"; }

.fa-vimeo-v:before {
  content: "\f27d"; }

.fa-contao:before {
  content: "\f26d"; }

.fa-square-font-awesome:before {
  content: "\e5ad"; }

.fa-deskpro:before {
  content: "\f38f"; }

.fa-sistrix:before {
  content: "\f3ee"; }

.fa-square-instagram:before {
  content: "\e055"; }

.fa-instagram-square:before {
  content: "\e055"; }

.fa-battle-net:before {
  content: "\f835"; }

.fa-the-red-yeti:before {
  content: "\f69d"; }

.fa-square-hacker-news:before {
  content: "\f3af"; }

.fa-hacker-news-square:before {
  content: "\f3af"; }

.fa-edge:before {
  content: "\f282"; }

.fa-threads:before {
  content: "\e618"; }

.fa-napster:before {
  content: "\f3d2"; }

.fa-square-snapchat:before {
  content: "\f2ad"; }

.fa-snapchat-square:before {
  content: "\f2ad"; }

.fa-google-plus-g:before {
  content: "\f0d5"; }

.fa-artstation:before {
  content: "\f77a"; }

.fa-markdown:before {
  content: "\f60f"; }

.fa-sourcetree:before {
  content: "\f7d3"; }

.fa-google-plus:before {
  content: "\f2b3"; }

.fa-diaspora:before {
  content: "\f791"; }

.fa-foursquare:before {
  content: "\f180"; }

.fa-stack-overflow:before {
  content: "\f16c"; }

.fa-github-alt:before {
  content: "\f113"; }

.fa-phoenix-squadron:before {
  content: "\f511"; }

.fa-pagelines:before {
  content: "\f18c"; }

.fa-algolia:before {
  content: "\f36c"; }

.fa-red-river:before {
  content: "\f3e3"; }

.fa-creative-commons-sa:before {
  content: "\f4ef"; }

.fa-safari:before {
  content: "\f267"; }

.fa-google:before {
  content: "\f1a0"; }

.fa-square-font-awesome-stroke:before {
  content: "\f35c"; }

.fa-font-awesome-alt:before {
  content: "\f35c"; }

.fa-atlassian:before {
  content: "\f77b"; }

.fa-linkedin-in:before {
  content: "\f0e1"; }

.fa-digital-ocean:before {
  content: "\f391"; }

.fa-nimblr:before {
  content: "\f5a8"; }

.fa-chromecast:before {
  content: "\f838"; }

.fa-evernote:before {
  content: "\f839"; }

.fa-hacker-news:before {
  content: "\f1d4"; }

.fa-creative-commons-sampling:before {
  content: "\f4f0"; }

.fa-adversal:before {
  content: "\f36a"; }

.fa-creative-commons:before {
  content: "\f25e"; }

.fa-watchman-monitoring:before {
  content: "\e087"; }

.fa-fonticons:before {
  content: "\f280"; }

.fa-weixin:before {
  content: "\f1d7"; }

.fa-shirtsinbulk:before {
  content: "\f214"; }

.fa-codepen:before {
  content: "\f1cb"; }

.fa-git-alt:before {
  content: "\f841"; }

.fa-lyft:before {
  content: "\f3c3"; }

.fa-rev:before {
  content: "\f5b2"; }

.fa-windows:before {
  content: "\f17a"; }

.fa-wizards-of-the-coast:before {
  content: "\f730"; }

.fa-square-viadeo:before {
  content: "\f2aa"; }

.fa-viadeo-square:before {
  content: "\f2aa"; }

.fa-meetup:before {
  content: "\f2e0"; }

.fa-centos:before {
  content: "\f789"; }

.fa-adn:before {
  content: "\f170"; }

.fa-cloudsmith:before {
  content: "\f384"; }

.fa-pied-piper-alt:before {
  content: "\f1a8"; }

.fa-square-dribbble:before {
  content: "\f397"; }

.fa-dribbble-square:before {
  content: "\f397"; }

.fa-codiepie:before {
  content: "\f284"; }

.fa-node:before {
  content: "\f419"; }

.fa-mix:before {
  content: "\f3cb"; }

.fa-steam:before {
  content: "\f1b6"; }

.fa-cc-apple-pay:before {
  content: "\f416"; }

.fa-scribd:before {
  content: "\f28a"; }

.fa-debian:before {
  content: "\e60b"; }

.fa-openid:before {
  content: "\f19b"; }

.fa-instalod:before {
  content: "\e081"; }

.fa-expeditedssl:before {
  content: "\f23e"; }

.fa-sellcast:before {
  content: "\f2da"; }

.fa-square-twitter:before {
  content: "\f081"; }

.fa-twitter-square:before {
  content: "\f081"; }

.fa-r-project:before {
  content: "\f4f7"; }

.fa-delicious:before {
  content: "\f1a5"; }

.fa-freebsd:before {
  content: "\f3a4"; }

.fa-vuejs:before {
  content: "\f41f"; }

.fa-accusoft:before {
  content: "\f369"; }

.fa-ioxhost:before {
  content: "\f208"; }

.fa-fonticons-fi:before {
  content: "\f3a2"; }

.fa-app-store:before {
  content: "\f36f"; }

.fa-cc-mastercard:before {
  content: "\f1f1"; }

.fa-itunes-note:before {
  content: "\f3b5"; }

.fa-golang:before {
  content: "\e40f"; }

.fa-kickstarter:before {
  content: "\f3bb"; }

.fa-grav:before {
  content: "\f2d6"; }

.fa-weibo:before {
  content: "\f18a"; }

.fa-uncharted:before {
  content: "\e084"; }

.fa-firstdraft:before {
  content: "\f3a1"; }

.fa-square-youtube:before {
  content: "\f431"; }

.fa-youtube-square:before {
  content: "\f431"; }

.fa-wikipedia-w:before {
  content: "\f266"; }

.fa-wpressr:before {
  content: "\f3e4"; }

.fa-rendact:before {
  content: "\f3e4"; }

.fa-angellist:before {
  content: "\f209"; }

.fa-galactic-republic:before {
  content: "\f50c"; }

.fa-nfc-directional:before {
  content: "\e530"; }

.fa-skype:before {
  content: "\f17e"; }

.fa-joget:before {
  content: "\f3b7"; }

.fa-fedora:before {
  content: "\f798"; }

.fa-stripe-s:before {
  content: "\f42a"; }

.fa-meta:before {
  content: "\e49b"; }

.fa-laravel:before {
  content: "\f3bd"; }

.fa-hotjar:before {
  content: "\f3b1"; }

.fa-bluetooth-b:before {
  content: "\f294"; }

.fa-sticker-mule:before {
  content: "\f3f7"; }

.fa-creative-commons-zero:before {
  content: "\f4f3"; }

.fa-hips:before {
  content: "\f452"; }

.fa-behance:before {
  content: "\f1b4"; }

.fa-reddit:before {
  content: "\f1a1"; }

.fa-discord:before {
  content: "\f392"; }

.fa-chrome:before {
  content: "\f268"; }

.fa-app-store-ios:before {
  content: "\f370"; }

.fa-cc-discover:before {
  content: "\f1f2"; }

.fa-wpbeginner:before {
  content: "\f297"; }

.fa-confluence:before {
  content: "\f78d"; }

.fa-mdb:before {
  content: "\f8ca"; }

.fa-dochub:before {
  content: "\f394"; }

.fa-accessible-icon:before {
  content: "\f368"; }

.fa-ebay:before {
  content: "\f4f4"; }

.fa-amazon:before {
  content: "\f270"; }

.fa-unsplash:before {
  content: "\e07c"; }

.fa-yarn:before {
  content: "\f7e3"; }

.fa-square-steam:before {
  content: "\f1b7"; }

.fa-steam-square:before {
  content: "\f1b7"; }

.fa-500px:before {
  content: "\f26e"; }

.fa-square-vimeo:before {
  content: "\f194"; }

.fa-vimeo-square:before {
  content: "\f194"; }

.fa-asymmetrik:before {
  content: "\f372"; }

.fa-font-awesome:before {
  content: "\f2b4"; }

.fa-font-awesome-flag:before {
  content: "\f2b4"; }

.fa-font-awesome-logo-full:before {
  content: "\f2b4"; }

.fa-gratipay:before {
  content: "\f184"; }

.fa-apple:before {
  content: "\f179"; }

.fa-hive:before {
  content: "\e07f"; }

.fa-gitkraken:before {
  content: "\f3a6"; }

.fa-keybase:before {
  content: "\f4f5"; }

.fa-apple-pay:before {
  content: "\f415"; }

.fa-padlet:before {
  content: "\e4a0"; }

.fa-amazon-pay:before {
  content: "\f42c"; }

.fa-square-github:before {
  content: "\f092"; }

.fa-github-square:before {
  content: "\f092"; }

.fa-stumbleupon:before {
  content: "\f1a4"; }

.fa-fedex:before {
  content: "\f797"; }

.fa-phoenix-framework:before {
  content: "\f3dc"; }

.fa-shopify:before {
  content: "\e057"; }

.fa-neos:before {
  content: "\f612"; }

.fa-square-threads:before {
  content: "\e619"; }

.fa-hackerrank:before {
  content: "\f5f7"; }

.fa-researchgate:before {
  content: "\f4f8"; }

.fa-swift:before {
  content: "\f8e1"; }

.fa-angular:before {
  content: "\f420"; }

.fa-speakap:before {
  content: "\f3f3"; }

.fa-angrycreative:before {
  content: "\f36e"; }

.fa-y-combinator:before {
  content: "\f23b"; }

.fa-empire:before {
  content: "\f1d1"; }

.fa-envira:before {
  content: "\f299"; }

.fa-square-gitlab:before {
  content: "\e5ae"; }

.fa-gitlab-square:before {
  content: "\e5ae"; }

.fa-studiovinari:before {
  content: "\f3f8"; }

.fa-pied-piper:before {
  content: "\f2ae"; }

.fa-wordpress:before {
  content: "\f19a"; }

.fa-product-hunt:before {
  content: "\f288"; }

.fa-firefox:before {
  content: "\f269"; }

.fa-linode:before {
  content: "\f2b8"; }

.fa-goodreads:before {
  content: "\f3a8"; }

.fa-square-odnoklassniki:before {
  content: "\f264"; }

.fa-odnoklassniki-square:before {
  content: "\f264"; }

.fa-jsfiddle:before {
  content: "\f1cc"; }

.fa-sith:before {
  content: "\f512"; }

.fa-themeisle:before {
  content: "\f2b2"; }

.fa-page4:before {
  content: "\f3d7"; }

.fa-hashnode:before {
  content: "\e499"; }

.fa-react:before {
  content: "\f41b"; }

.fa-cc-paypal:before {
  content: "\f1f4"; }

.fa-squarespace:before {
  content: "\f5be"; }

.fa-cc-stripe:before {
  content: "\f1f5"; }

.fa-creative-commons-share:before {
  content: "\f4f2"; }

.fa-bitcoin:before {
  content: "\f379"; }

.fa-keycdn:before {
  content: "\f3ba"; }

.fa-opera:before {
  content: "\f26a"; }

.fa-itch-io:before {
  content: "\f83a"; }

.fa-umbraco:before {
  content: "\f8e8"; }

.fa-galactic-senate:before {
  content: "\f50d"; }

.fa-ubuntu:before {
  content: "\f7df"; }

.fa-draft2digital:before {
  content: "\f396"; }

.fa-stripe:before {
  content: "\f429"; }

.fa-houzz:before {
  content: "\f27c"; }

.fa-gg:before {
  content: "\f260"; }

.fa-dhl:before {
  content: "\f790"; }

.fa-square-pinterest:before {
  content: "\f0d3"; }

.fa-pinterest-square:before {
  content: "\f0d3"; }

.fa-xing:before {
  content: "\f168"; }

.fa-blackberry:before {
  content: "\f37b"; }

.fa-creative-commons-pd:before {
  content: "\f4ec"; }

.fa-playstation:before {
  content: "\f3df"; }

.fa-quinscape:before {
  content: "\f459"; }

.fa-less:before {
  content: "\f41d"; }

.fa-blogger-b:before {
  content: "\f37d"; }

.fa-opencart:before {
  content: "\f23d"; }

.fa-vine:before {
  content: "\f1ca"; }

.fa-paypal:before {
  content: "\f1ed"; }

.fa-gitlab:before {
  content: "\f296"; }

.fa-typo3:before {
  content: "\f42b"; }

.fa-reddit-alien:before {
  content: "\f281"; }

.fa-yahoo:before {
  content: "\f19e"; }

.fa-dailymotion:before {
  content: "\e052"; }

.fa-affiliatetheme:before {
  content: "\f36b"; }

.fa-pied-piper-pp:before {
  content: "\f1a7"; }

.fa-bootstrap:before {
  content: "\f836"; }

.fa-odnoklassniki:before {
  content: "\f263"; }

.fa-nfc-symbol:before {
  content: "\e531"; }

.fa-ethereum:before {
  content: "\f42e"; }

.fa-speaker-deck:before {
  content: "\f83c"; }

.fa-creative-commons-nc-eu:before {
  content: "\f4e9"; }

.fa-patreon:before {
  content: "\f3d9"; }

.fa-avianex:before {
  content: "\f374"; }

.fa-ello:before {
  content: "\f5f1"; }

.fa-gofore:before {
  content: "\f3a7"; }

.fa-bimobject:before {
  content: "\f378"; }

.fa-facebook-f:before {
  content: "\f39e"; }

.fa-square-google-plus:before {
  content: "\f0d4"; }

.fa-google-plus-square:before {
  content: "\f0d4"; }

.fa-mandalorian:before {
  content: "\f50f"; }

.fa-first-order-alt:before {
  content: "\f50a"; }

.fa-osi:before {
  content: "\f41a"; }

.fa-google-wallet:before {
  content: "\f1ee"; }

.fa-d-and-d-beyond:before {
  content: "\f6ca"; }

.fa-periscope:before {
  content: "\f3da"; }

.fa-fulcrum:before {
  content: "\f50b"; }

.fa-cloudscale:before {
  content: "\f383"; }

.fa-forumbee:before {
  content: "\f211"; }

.fa-mizuni:before {
  content: "\f3cc"; }

.fa-schlix:before {
  content: "\f3ea"; }

.fa-square-xing:before {
  content: "\f169"; }

.fa-xing-square:before {
  content: "\f169"; }

.fa-bandcamp:before {
  content: "\f2d5"; }

.fa-wpforms:before {
  content: "\f298"; }

.fa-cloudversify:before {
  content: "\f385"; }

.fa-usps:before {
  content: "\f7e1"; }

.fa-megaport:before {
  content: "\f5a3"; }

.fa-magento:before {
  content: "\f3c4"; }

.fa-spotify:before {
  content: "\f1bc"; }

.fa-optin-monster:before {
  content: "\f23c"; }

.fa-fly:before {
  content: "\f417"; }

.fa-aviato:before {
  content: "\f421"; }

.fa-itunes:before {
  content: "\f3b4"; }

.fa-cuttlefish:before {
  content: "\f38c"; }

.fa-blogger:before {
  content: "\f37c"; }

.fa-flickr:before {
  content: "\f16e"; }

.fa-viber:before {
  content: "\f409"; }

.fa-soundcloud:before {
  content: "\f1be"; }

.fa-digg:before {
  content: "\f1a6"; }

.fa-tencent-weibo:before {
  content: "\f1d5"; }

.fa-symfony:before {
  content: "\f83d"; }

.fa-maxcdn:before {
  content: "\f136"; }

.fa-etsy:before {
  content: "\f2d7"; }

.fa-facebook-messenger:before {
  content: "\f39f"; }

.fa-audible:before {
  content: "\f373"; }

.fa-think-peaks:before {
  content: "\f731"; }

.fa-bilibili:before {
  content: "\e3d9"; }

.fa-erlang:before {
  content: "\f39d"; }

.fa-x-twitter:before {
  content: "\e61b"; }

.fa-cotton-bureau:before {
  content: "\f89e"; }

.fa-dashcube:before {
  content: "\f210"; }

.fa-42-group:before {
  content: "\e080"; }

.fa-innosoft:before {
  content: "\e080"; }

.fa-stack-exchange:before {
  content: "\f18d"; }

.fa-elementor:before {
  content: "\f430"; }

.fa-square-pied-piper:before {
  content: "\e01e"; }

.fa-pied-piper-square:before {
  content: "\e01e"; }

.fa-creative-commons-nd:before {
  content: "\f4eb"; }

.fa-palfed:before {
  content: "\f3d8"; }

.fa-superpowers:before {
  content: "\f2dd"; }

.fa-resolving:before {
  content: "\f3e7"; }

.fa-xbox:before {
  content: "\f412"; }

.fa-searchengin:before {
  content: "\f3eb"; }

.fa-tiktok:before {
  content: "\e07b"; }

.fa-square-facebook:before {
  content: "\f082"; }

.fa-facebook-square:before {
  content: "\f082"; }

.fa-renren:before {
  content: "\f18b"; }

.fa-linux:before {
  content: "\f17c"; }

.fa-glide:before {
  content: "\f2a5"; }

.fa-linkedin:before {
  content: "\f08c"; }

.fa-hubspot:before {
  content: "\f3b2"; }

.fa-deploydog:before {
  content: "\f38e"; }

.fa-twitch:before {
  content: "\f1e8"; }

.fa-ravelry:before {
  content: "\f2d9"; }

.fa-mixer:before {
  content: "\e056"; }

.fa-square-lastfm:before {
  content: "\f203"; }

.fa-lastfm-square:before {
  content: "\f203"; }

.fa-vimeo:before {
  content: "\f40a"; }

.fa-mendeley:before {
  content: "\f7b3"; }

.fa-uniregistry:before {
  content: "\f404"; }

.fa-figma:before {
  content: "\f799"; }

.fa-creative-commons-remix:before {
  content: "\f4ee"; }

.fa-cc-amazon-pay:before {
  content: "\f42d"; }

.fa-dropbox:before {
  content: "\f16b"; }

.fa-instagram:before {
  content: "\f16d"; }

.fa-cmplid:before {
  content: "\e360"; }

.fa-facebook:before {
  content: "\f09a"; }

.fa-gripfire:before {
  content: "\f3ac"; }

.fa-jedi-order:before {
  content: "\f50e"; }

.fa-uikit:before {
  content: "\f403"; }

.fa-fort-awesome-alt:before {
  content: "\f3a3"; }

.fa-phabricator:before {
  content: "\f3db"; }

.fa-ussunnah:before {
  content: "\f407"; }

.fa-earlybirds:before {
  content: "\f39a"; }

.fa-trade-federation:before {
  content: "\f513"; }

.fa-autoprefixer:before {
  content: "\f41c"; }

.fa-whatsapp:before {
  content: "\f232"; }

.fa-slideshare:before {
  content: "\f1e7"; }

.fa-google-play:before {
  content: "\f3ab"; }

.fa-viadeo:before {
  content: "\f2a9"; }

.fa-line:before {
  content: "\f3c0"; }

.fa-google-drive:before {
  content: "\f3aa"; }

.fa-servicestack:before {
  content: "\f3ec"; }

.fa-simplybuilt:before {
  content: "\f215"; }

.fa-bitbucket:before {
  content: "\f171"; }

.fa-imdb:before {
  content: "\f2d8"; }

.fa-deezer:before {
  content: "\e077"; }

.fa-raspberry-pi:before {
  content: "\f7bb"; }

.fa-jira:before {
  content: "\f7b1"; }

.fa-docker:before {
  content: "\f395"; }

.fa-screenpal:before {
  content: "\e570"; }

.fa-bluetooth:before {
  content: "\f293"; }

.fa-gitter:before {
  content: "\f426"; }

.fa-d-and-d:before {
  content: "\f38d"; }

.fa-microblog:before {
  content: "\e01a"; }

.fa-cc-diners-club:before {
  content: "\f24c"; }

.fa-gg-circle:before {
  content: "\f261"; }

.fa-pied-piper-hat:before {
  content: "\f4e5"; }

.fa-kickstarter-k:before {
  content: "\f3bc"; }

.fa-yandex:before {
  content: "\f413"; }

.fa-readme:before {
  content: "\f4d5"; }

.fa-html5:before {
  content: "\f13b"; }

.fa-sellsy:before {
  content: "\f213"; }

.fa-sass:before {
  content: "\f41e"; }

.fa-wirsindhandwerk:before {
  content: "\e2d0"; }

.fa-wsh:before {
  content: "\e2d0"; }

.fa-buromobelexperte:before {
  content: "\f37f"; }

.fa-salesforce:before {
  content: "\f83b"; }

.fa-octopus-deploy:before {
  content: "\e082"; }

.fa-medapps:before {
  content: "\f3c6"; }

.fa-ns8:before {
  content: "\f3d5"; }

.fa-pinterest-p:before {
  content: "\f231"; }

.fa-apper:before {
  content: "\f371"; }

.fa-fort-awesome:before {
  content: "\f286"; }

.fa-waze:before {
  content: "\f83f"; }

.fa-cc-jcb:before {
  content: "\f24b"; }

.fa-snapchat:before {
  content: "\f2ab"; }

.fa-snapchat-ghost:before {
  content: "\f2ab"; }

.fa-fantasy-flight-games:before {
  content: "\f6dc"; }

.fa-rust:before {
  content: "\e07a"; }

.fa-wix:before {
  content: "\f5cf"; }

.fa-square-behance:before {
  content: "\f1b5"; }

.fa-behance-square:before {
  content: "\f1b5"; }

.fa-supple:before {
  content: "\f3f9"; }

.fa-rebel:before {
  content: "\f1d0"; }

.fa-css3:before {
  content: "\f13c"; }

.fa-staylinked:before {
  content: "\f3f5"; }

.fa-kaggle:before {
  content: "\f5fa"; }

.fa-space-awesome:before {
  content: "\e5ac"; }

.fa-deviantart:before {
  content: "\f1bd"; }

.fa-cpanel:before {
  content: "\f388"; }

.fa-goodreads-g:before {
  content: "\f3a9"; }

.fa-square-git:before {
  content: "\f1d2"; }

.fa-git-square:before {
  content: "\f1d2"; }

.fa-square-tumblr:before {
  content: "\f174"; }

.fa-tumblr-square:before {
  content: "\f174"; }

.fa-trello:before {
  content: "\f181"; }

.fa-creative-commons-nc-jp:before {
  content: "\f4ea"; }

.fa-get-pocket:before {
  content: "\f265"; }

.fa-perbyte:before {
  content: "\e083"; }

.fa-grunt:before {
  content: "\f3ad"; }

.fa-weebly:before {
  content: "\f5cc"; }

.fa-connectdevelop:before {
  content: "\f20e"; }

.fa-leanpub:before {
  content: "\f212"; }

.fa-black-tie:before {
  content: "\f27e"; }

.fa-themeco:before {
  content: "\f5c6"; }

.fa-python:before {
  content: "\f3e2"; }

.fa-android:before {
  content: "\f17b"; }

.fa-bots:before {
  content: "\e340"; }

.fa-free-code-camp:before {
  content: "\f2c5"; }

.fa-hornbill:before {
  content: "\f592"; }

.fa-js:before {
  content: "\f3b8"; }

.fa-ideal:before {
  content: "\e013"; }

.fa-git:before {
  content: "\f1d3"; }

.fa-dev:before {
  content: "\f6cc"; }

.fa-sketch:before {
  content: "\f7c6"; }

.fa-yandex-international:before {
  content: "\f414"; }

.fa-cc-amex:before {
  content: "\f1f3"; }

.fa-uber:before {
  content: "\f402"; }

.fa-github:before {
  content: "\f09b"; }

.fa-php:before {
  content: "\f457"; }

.fa-alipay:before {
  content: "\f642"; }

.fa-youtube:before {
  content: "\f167"; }

.fa-skyatlas:before {
  content: "\f216"; }

.fa-firefox-browser:before {
  content: "\e007"; }

.fa-replyd:before {
  content: "\f3e6"; }

.fa-suse:before {
  content: "\f7d6"; }

.fa-jenkins:before {
  content: "\f3b6"; }

.fa-twitter:before {
  content: "\f099"; }

.fa-rockrms:before {
  content: "\f3e9"; }

.fa-pinterest:before {
  content: "\f0d2"; }

.fa-buffer:before {
  content: "\f837"; }

.fa-npm:before {
  content: "\f3d4"; }

.fa-yammer:before {
  content: "\f840"; }

.fa-btc:before {
  content: "\f15a"; }

.fa-dribbble:before {
  content: "\f17d"; }

.fa-stumbleupon-circle:before {
  content: "\f1a3"; }

.fa-internet-explorer:before {
  content: "\f26b"; }

.fa-stubber:before {
  content: "\e5c7"; }

.fa-telegram:before {
  content: "\f2c6"; }

.fa-telegram-plane:before {
  content: "\f2c6"; }

.fa-old-republic:before {
  content: "\f510"; }

.fa-odysee:before {
  content: "\e5c6"; }

.fa-square-whatsapp:before {
  content: "\f40c"; }

.fa-whatsapp-square:before {
  content: "\f40c"; }

.fa-node-js:before {
  content: "\f3d3"; }

.fa-edge-legacy:before {
  content: "\e078"; }

.fa-slack:before {
  content: "\f198"; }

.fa-slack-hash:before {
  content: "\f198"; }

.fa-medrt:before {
  content: "\f3c8"; }

.fa-usb:before {
  content: "\f287"; }

.fa-tumblr:before {
  content: "\f173"; }

.fa-vaadin:before {
  content: "\f408"; }

.fa-quora:before {
  content: "\f2c4"; }

.fa-square-x-twitter:before {
  content: "\e61a"; }

.fa-reacteurope:before {
  content: "\f75d"; }

.fa-medium:before {
  content: "\f23a"; }

.fa-medium-m:before {
  content: "\f23a"; }

.fa-amilia:before {
  content: "\f36d"; }

.fa-mixcloud:before {
  content: "\f289"; }

.fa-flipboard:before {
  content: "\f44d"; }

.fa-viacoin:before {
  content: "\f237"; }

.fa-critical-role:before {
  content: "\f6c9"; }

.fa-sitrox:before {
  content: "\e44a"; }

.fa-discourse:before {
  content: "\f393"; }

.fa-joomla:before {
  content: "\f1aa"; }

.fa-mastodon:before {
  content: "\f4f6"; }

.fa-airbnb:before {
  content: "\f834"; }

.fa-wolf-pack-battalion:before {
  content: "\f514"; }

.fa-buy-n-large:before {
  content: "\f8a6"; }

.fa-gulp:before {
  content: "\f3ae"; }

.fa-creative-commons-sampling-plus:before {
  content: "\f4f1"; }

.fa-strava:before {
  content: "\f428"; }

.fa-ember:before {
  content: "\f423"; }

.fa-canadian-maple-leaf:before {
  content: "\f785"; }

.fa-teamspeak:before {
  content: "\f4f9"; }

.fa-pushed:before {
  content: "\f3e1"; }

.fa-wordpress-simple:before {
  content: "\f411"; }

.fa-nutritionix:before {
  content: "\f3d6"; }

.fa-wodu:before {
  content: "\e088"; }

.fa-google-pay:before {
  content: "\e079"; }

.fa-intercom:before {
  content: "\f7af"; }

.fa-zhihu:before {
  content: "\f63f"; }

.fa-korvue:before {
  content: "\f42f"; }

.fa-pix:before {
  content: "\e43a"; }

.fa-steam-symbol:before {
  content: "\f3f6"; }
:root, :host {
  --fa-style-family-classic: 'Font Awesome 6 Free';
  --fa-font-regular: normal 400 1em/1 'Font Awesome 6 Free'; }

@font-face {
  font-family: 'Font Awesome 6 Free';
  font-style: normal;
  font-weight: 400;
  font-display: block;
  src: url("../webfonts/FontAwesome6Free-Regular-400.woff2") format("woff2"), url("../webfonts/FontAwesome6Free-Regular-400.ttf") format("truetype"); }

.far,
.fa-regular {
  font-weight: 400; }
:root, :host {
  --fa-style-family-classic: 'Font Awesome 6 Free';
  --fa-font-solid: normal 900 1em/1 'Font Awesome 6 Free'; }

@font-face {
  font-family: 'Font Awesome 6 Free';
  font-style: normal;
  font-weight: 900;
  font-display: block;
  src: url("../webfonts/FontAwesome6Free-Solid-900.woff2") format("woff2"), url("../webfonts/FontAwesome6Free-Solid-900.ttf") format("truetype"); }

.fas,
.fa-solid {
  font-weight: 900; }
@font-face {
  font-family: 'Font Awesome 6 Brands';
  font-display: block;
  font-weight: 400;
  src: url("../webfonts/FontAwesome6Brands-Regular-400.woff2") format("woff2"), url("../webfonts/FontAwesome6Brands-Regular-400.ttf") format("truetype"); }

@font-face {
  font-family: 'Font Awesome 6 Free';
  font-display: block;
  font-weight: 900;
  src: url("../webfonts/FontAwesome6Free-Solid-900.woff2") format("woff2"), url("../webfonts/FontAwesome6Free-Solid-900.ttf") format("truetype"); }

@font-face {
  font-family: 'Font Awesome 6 Free';
  font-display: block;
  font-weight: 400;
  src: url("../webfonts/../webfonts/FontAwesome6Free-Regular-400.woff2") format("woff2"), url("../webfonts/FontAwesome6Free-Regular-400.ttf") format("truetype"); }
@font-face {
  font-family: 'Font Awesome 6 Free';
  font-display: block;
  src: url("../webfonts/FontAwesome6Free-Solid-900.woff2") format("woff2"), url("../webfonts/FontAwesome6Free-Solid-900.ttf") format("truetype"); }

@font-face {
  font-family: 'Font Awesome 6 Brands';
  font-display: block;
  src: url("../webfonts/FontAwesome6Brands-Regular-400.woff2") format("woff2"), url("../webfonts/FontAwesome6Brands-Regular-400.ttf") format("truetype"); }

@font-face {
  font-family: 'Font Awesome 6 Free';
  font-display: block;
  src: url("../webfonts/FontAwesome6Free-Regular-400.woff2") format("woff2"), url("../../webfonts/FontAwesome6Free-Regular-400.ttf") format("truetype");
  unicode-range: U+F003,U+F006,U+F014,U+F016-F017,U+F01A-F01B,U+F01D,U+F022,U+F03E,U+F044,U+F046,U+F05C-F05D,U+F06E,U+F070,U+F087-F088,U+F08A,U+F094,U+F096-F097,U+F09D,U+F0A0,U+F0A2,U+F0A4-F0A7,U+F0C5,U+F0C7,U+F0E5-F0E6,U+F0EB,U+F0F6-F0F8,U+F10C,U+F114-F115,U+F118-F11A,U+F11C-F11D,U+F133,U+F147,U+F14E,U+F150-F152,U+F185-F186,U+F18E,U+F190-F192,U+F196,U+F1C1-F1C9,U+F1D9,U+F1DB,U+F1E3,U+F1EA,U+F1F7,U+F1F9,U+F20A,U+F247-F248,U+F24A,U+F24D,U+F255-F25B,U+F25D,U+F271-F274,U+F278,U+F27B,U+F28C,U+F28E,U+F29C,U+F2B5,U+F2B7,U+F2BA,U+F2BC,U+F2BE,U+F2C0-F2C1,U+F2C3,U+F2D0,U+F2D2,U+F2D4,U+F2DC; }

<!-- end_file: "_extensions/fontawesome/assets/css/all.css" -->


<!-- begin_file: "_extensions/fontawesome/assets/css/latex-fontsize.css" -->.fa-tiny {
  font-size: 0.5em;
}
.fa-scriptsize {
  font-size: 0.7em;
}
.fa-footnotesize {
  font-size: 0.8em;
}
.fa-small {
  font-size: 0.9em;
}
.fa-normalsize {
  font-size: 1em;
}
.fa-large {
  font-size: 1.2em;
}
.fa-Large {
  font-size: 1.5em;
}
.fa-LARGE {
  font-size: 1.75em;
}
.fa-huge {
  font-size: 2em;
}
.fa-Huge {
  font-size: 2.5em;
}

<!-- end_file: "_extensions/fontawesome/assets/css/latex-fontsize.css" -->


<!-- begin_file: "compile.rb" -->#!/usr/bin/env ruby
# encoding: utf-8

# Rewrite of Scrivener markdown for cross-referencing system used by Quarto; also adds paths for LaTeX, python and others.
# Version: 0.1.11 (2024-11-08-17-24)
# Script by [Iandol](https://github.com/iandol) & Bernardo Vasconcelos.

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
tstart = Time.now

require 'tempfile' # temp file tools
require 'fileutils' # ruby standard library to deal with files
require 'timeout'
#require 'debug/open_nonstop' # debugger

rep_patterns = { /(id=""|width=""|height="")/ => '',
                 /\s+width=/ => ' width=',
                 /{\s*(#.*?)\s*}/ => '{\1}',
                 /\{\s*(.+?)\s*\}/ => '{\1}',
                 /^(#+) (.+?)\{\s*\}/ => '\1 \2',
                 /(\n|\s|\h)+\Z/ => "\n\n",
                 /\n{4,}/ => "\n\n", # cosmetic only: remove long runs (4 or more) of newlines
                 /\$\$ ?\n\{\#eq/ => '$$ {#eq' # puts {#id} onto end of $$ math block lines
}

dry_run = false # set to true to test without overwriting the file
# decrease_heading_cmd = 'quarto pandoc -f markdown -t markdown --shift-heading-level-by=-1 --wrap=none'
in_filename = File.expand_path(ARGV[0])

outo_filename = in_filename.gsub(/\.[q]?md$/,'.qmd') # output to [name].qmd
to_file = Tempfile.new('fix-x-refs') # create a temp file

puts "--> Input Filename: #{in_filename}"

fail 'The specified file does not exist!' unless in_filename && File.file?(in_filename)

fileType = ARGV[1]
if fileType.nil? || fileType !~ /(plain|markdown|html|pdf|epub|docx|latex|odt|beamer|revealjs|pptx)/
  fileType = ''
end

def inline_fn(str, style = :pandoc)
  return str unless str.is_a?(String) && !str.empty? && str.include?('[^')

  ref_start = ''
  text = str.gsub(/\[\^fn(\d+)/, '[^\1') # Remove the fn prefix from footnotes)
  counter = 0

  until ref_start.nil?
    counter += 1
    cite      = "[^#{counter}]"
    ref       = "[^#{counter}]:"
    ref_start = text.index(ref)
    break if ref_start.nil?

    next_ref = "[^#{counter + 1}]:"
    ref_end  = text.index(next_ref).nil? ? -1 : text.index(next_ref) - 2
    offset   = counter.to_s.length + 5
    note     = case style
               when :mmd
                 "[^#{text[ref_start + offset..ref_end].strip}]"
               else
                 "^[#{text[ref_start + offset..ref_end].strip}]"
               end

    text = text.gsub(cite, note)
  end

  if counter >= 1
    case style
    when :mmd
      text = text.gsub(/\n\s*\[\^/, "\n[^")
      cut_point = text.index("\n[^")
    else
      text = text.gsub(/\n\s*\^\[/, "\n^[")
      cut_point = text.index("\n^")
    end

    text = text[0, cut_point]
    puts "--> #{counter -= 1} notes replaced."
  end
  text
end

def inline_fn_pandoc(text)
  inline_fn(text, :pandoc)
end

def inline_fn_mmd(text)
  inline_fn(text, :mmd)
end

def makePath() # this method augments our environment path
  home = "#{ENV['HOME']}/"
  envpath = ''
  pathtest = ["#{home}.rbenv/shims", "#{home}.pyenv/shims", '/usr/local/bin',
              '/usr/local/opt/ruby/bin', '/usr/local/lib/ruby/gems/2.7.0/bin',
              '/Library/TeX/texbin', '/opt/homebrew/bin',
              "#{home}anaconda/bin", "#{home}anaconda3/bin", "#{home}miniconda/bin", "#{home}miniconda3/bin",
              "#{home}.cabal/bin", "#{home}.local/bin"]
  pathtest.each { |p| envpath = "#{envpath}:#{p}" if File.directory?(p) }
  envpath.gsub!(/\/{2}/, '/')
  envpath.gsub!(/:{2}/, ':')
  envpath.gsub!(/(^:|:$)/, '')
  ENV['PATH'] = "#{envpath}:#{ENV['PATH']}"
  ENV['LANG'] = 'en_GB.UTF-8' if ENV['LANG'].nil? # Just in case we have no LANG, which breaks UTF8 encoding
  puts "--> Modified path: #{ENV['PATH'].chomp}"
end # end makePath()

def isRecent(infile) # checks if a file is less than 3 minutes old
  return false if !File.file?(infile)

  filetime = File.mtime(infile) # modified time
  difftime = Time.now - filetime # compare to now
  if difftime <= 180
    return true
  else
    return false
  end
end

makePath()

begin
  File.open(in_filename, 'r') do |file|
    text = file.read
    # Figure markup needs to go from the bottom to their in-line references.
    # From
    # [{#fig-id} Caption][Reference]
    # [Reference]: File.jpg {width=486 height=402}
    # To
    # ![Caption](File.png){#fig-ulysses1 width=486 height=402}
    f = 0 # of figures
    figures_data = text.scan(/^\[(.+?)\]: (.+?) \{(.+?)}$/) # Capture [caption]: fig.png
    figures = text.scan(/^!\[(.*?)\]\[(.+?)\]/) # Capture ![caption][reference]

    figures_data.each do |data|
      figures.each do |fig|
        next unless data[0] == fig[1]

        f += 1
        # ![caption][reference]
        search = "![#{fig[0]}][#{data[0]}]"
        # Capture figure id in the caption
        fig_id = fig[0][/#fig-.*?/] ? "#{fig[0].match(/#fig-(\w|-)+/)} " : ''
        fig_file = data[1].strip
        # Capture width in the caption
        width = fig[0][/width=([0-9]|\w|")+/] ? fig[0].match(/width=([0-9]|\w|")+/).to_s : ''
        # Capture height in the caption
        height = fig[0][/height=([0-9]|\w|")+/] ? fig[0].match(/height=([0-9]|\w|")+/).to_s : ''
        # If no width or height in the caption, use Scrivener's reference
        width_and_height = width.empty? && height.empty? ? data[2].to_s : "#{width} #{height}".strip
        # Caption text
        caption_text = fig[0].gsub(/\{.*?}/, '').strip

        # Replace text with the full reference
        text.gsub!(search, "![#{caption_text}](#{fig_file}){#{fig_id}#{width_and_height}}")
        # puts "----> Found figure: ![#{caption_text}](#{fig_file}){#{fig_id}#{width_and_height}}"
      end
      # Erase Scrivener references at end of file
      text.gsub!(/^\[(?<reference>.+?)\]: (?<url>.+?) ?\{(?<dimensions>.+?)}$\n*/, '')
    end
    puts "--> #{f} figures fixed." if f.positive?

    # Convert footnotes to pandoc style
    text = inline_fn_pandoc("#{text}\n\n")
    # Replace patterns
    rep_patterns.each do |pattern, replacement|
      text.gsub!(pattern, replacement)
    end
    # Extract and create files from pattern
    # <!-- begin_file: "path/to/file.ext" -->`file_content`<!-- end_file: "path/to/file.ext" -->\n
    if text =~ /<!-- begin_file: "([^"]+)" -->/ # If there are new files to be added
      # Array to store new files
      new_files = []
      # Get the new files
      text.scan(/<!-- begin_file: "([^"]+)" -->/) do |match|
        # puts "----> Found new file: #{match[0]}"
        new_files << match[0]
      end

      # Array to store created files for logging
      created_files = []
      new_files.each do |file|
        pattern = /<!-- begin_file: "#{file}" -->(.+?)<!-- end_file: "#{file}" -->/m
        # Get the file content
        file_content = text[pattern] ? text.scan(pattern)[0][0] : ''
        # Check if path exists, if not create it
        FileUtils.mkdir_p(File.dirname(file))
        # Write the file
        File.open(file, 'w') { |f| f.write(file_content) }
        # Add the file to the created files array
        created_files << file
        # `#{decrease_heading_cmd} "#{file}" -o "#{file}"` if file[/\.[q]?md$/]
        text.gsub!(pattern, '') unless file_content.nil? || file_content.empty?
      end
      puts "--> #{created_files.count} files created" if created_files.any?
    else
      puts '--> No new files detected!'
    end
    to_file.puts text.gsub(/\n{2,}/, "\n\n")
  end
  to_file.close
  FileUtils.mv(to_file.path, outo_filename)
ensure
  to_file.close
  to_file.delete
end

# Build and run our quarto command
cmd = if fileType.empty?
        "quarto render \"#{outo_filename}\""
      else
        "quarto render \"#{outo_filename}\" --to #{fileType}"
      end


unless dry_run
  begin
    pid = Process.spawn(cmd)
    Timeout.timeout(60) do
      puts "--> Running Command: #{cmd}" unless dry_run
      Process.wait(pid)
      puts 'Process finished in time'
    end
  rescue Timeout::Error
    puts 'Process not finished in time, killing it'
    Process.kill('TERM', pid)
    # open any log file (generated from scrivener's post-processing)
    `open Quarto.log` if File.file?('Quarto.log') && isRecent('Quarto.log')
  end
  fileType = 'html' if fileType.match(/revealjs|s5|slidous|html5/)
  res = outo_filename.gsub(/\.qmd$/, ".#{fileType}")
  if File.file?(res) && isRecent(res) && dry_run == false
    `open "#{res}"`
  else
    puts "There was some problem opening #{res}, check compiler log..."
  end
#  `open "#{outo_filename}"`
end

tend = Time.now - tstart
puts "--> Processing took: #{tend.to_s}s"

<!-- end_file: "compile.rb" -->


[screencap]: screencap.png {width=248 height=54}

[BibliographyFile]: BibliographyFile.png {width=430 height=356}

[backrefs]: backrefs.png {width=465 height=258}

[Ulysses-sirens]: Ulysses-sirens.jpg {width=486 height=402}

[Elephant2]: Elephant2.jpg {width=245 height=252}

[Elephant3]: Elephant3.jpg {width=306 height=249}

[^fn1]: If you're on a Mac, install Homebrew by pasting the following on the Terminal: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.

[^fn2]: Please note that [tinytex](https://quarto.org/docs/output-formats/pdf-engine.html#installing-tex) is also required for LaTeX to PDF output.

[^fn3]: The rendered citation will appear only in the output document; but not in the Scrivener project.

[^fn4]: Zotero even offers an API to download shared libraries by merely accessing a link, such as `https://api.zotero.org/groups/`LibraryID`/items?format=bibtex&limit=999` where `LibraryID` corresponds to the library's 7-digit code (visible in the middle of the library URL).

[^fn5]: The reader will see the page number instead of a crescent ordinal number in some output formats, such as PDF.

[^fn6]: Text section with ID for cross-referencing.