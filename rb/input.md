<!-- begin_file: "" -->
Welcome to the ScrivQ Template for Scrivener. To learn more about the project, head to the [about page]().
<!-- end_file: "" -->
  
<!-- begin_file: "abstract.qmd" -->
[This sample project demonstrates a workflow using the Quarto scientific publishing system run using the Scrivener Compiler]{.smallcaps}. Quarto utilises Pandoc and combines several extensions and nice templates to support many layout tweaks and advanced cross-referencing. Pandoc itself supports lots of academic features like bibliographies etc. This workflow uses Scrivener Paragraph «block» and Character «inline» styles where applicable for handling formatting, demonstrates an alternative using Section Types (with optional attributes), and also shows the fall back to plain raw markdown as a third alternative for handling Quarto's layout features. A custom post-processing Ruby script included in the Compile Format sets up the path automatically and modifies Scrivener's markdown output so that it is compatible with Quarto's cross-referencing filter.  


<!-- end_file: "abstract.qmd" -->
  
<!-- begin_file: "introduction.qmd" -->
> *"We don't see things as they are, we see them as we are." --- Anaïs Nin*  

Lørem ipsum dolør sit amet, eu ipsum movet vix, veniam låoreet posidonium[^fn1] te eøs, eæm in veri eirmod [@barrett2015; @crivellato2007]. Sed illum minimum at 3.25×10⁴⁸ (see [@sec-scriv17]), est mægna alienum mentitum ne. [Amet equidem](quarto.org/) sit ex (see [@sec-scriv25]). Ludus øfficiis suåvitate sea in, ius utinam vivendum no, mei nostrud necessitatibus te?  



![{#fig-scriv3 .column-page} "*What a trip!*" - said Ulysses as he sailed by the sirens. We add the *cross-referencing label* to the **_start_** of the caption. This label will get moved to the correct place in the markdown by the post-processing script **_before_** Quarto is run. This figure also demonstrates the Scrivener trick of using a Binder-linked figure followed by a Paragraph Style `Caption` which the Scrivener compiler converts to the correct markdown to generate a captioned image block!][Ulysses1]

Sint meis quo et, vis ad fæcete dolorem! Ad quøt moderatius elaboraret eum[@crivellato2007], pro paulo ridens quaestio ut (see [@fig-scriv3])! Iudico nullam sit ad, ad has åperiam senserit conceptåm? Tritani posidonium suscipiantur ex duo, meæ essent mentitum ad. Nåm ex mucius mandamus, ut duo cåusae offendit laboramus. Duo iisque sapientem ad, vølumus persecuti vix cu, **_his åt justo putant comprehensam (this style is strong emphasis)_**.  

Ad pro quod ^superscript^, mel no laudem ~subscript~, te mei prompta maiorum pønderum [@siegel2015; @copenhaver2014; @hoffman2014; @barrett2015; @simmons2013]. Solum aeque singulis duo ex, est an iriure øblique.  


:::{.column-margin}
Here is some marginalia using the [`Marginalia`] Paragraph Style, *including* a citation [@barrett2015]. This will end up as a margin note in HTML and PDF outputs, but a normal paragraph in DOCX etc.
:::


Volumus åntiøpam iudicåbit et pro, cibo ubique hås an? Cu his movet feugiåt pårtiendo [@barrett2015; @crivellato2007]! Eam in ubique høneståtis ullåmcorper, no eos vitae orætiø viderer. Eos id amet alienum, vis id zril åliquando omittantur, no mei graeci impedit deterruisset!  


:::{.callout-tip}
This callout is generated using the [`Callout Tip`] Scrivener Paragraph Style...
:::


This is a standard native Scrivener list, which will get converted to markdown by the Scrivener compiler: 


* Item 1
* Item 2
    * Item 2a
    * Item 2b
* Item 3

No meæ menandri mediøcritatem, meis tibique convenire vis id! Delicata intellegam mei ex. His consulåtu åssueverit ex, ei ius apeirian cønstituam mediocritatem, mei rebum detracto scaevølæ ex. Sed modo dico ullum at, sententiae definiebas ex eam! Nøstro eruditi eum ex.  See [@tbl-scriv3] for more details.   


| Table Head 1 | Table Head 2 | Table Head 3 |
| ----- | ----- | ----- |
| Item 1 | Item 2 | Item 3 |
| Item 4 | Item 5 | Item 6 |
| Item 7 | Item 8 | Item 9 |
| Item 10 | Item 11 | Item 12 |

: This is native Scrivener table with a referenced table caption. You could also use one of the many markdown table types, and lower down this sample project demonstrates using R to make tables. {#tbl-scriv3}

Åd nam omnis ullamcørper vituperatoribus. Sed verear tincidunt rationibus an. Elit såperet recteque sit et, tåmquåm noluisse eloquentiåm ei mei. In pri solet soleat timeam, tale possit vis æt.  


<!-- end_file: "introduction.qmd" -->
  
<!-- begin_file: "methods.qmd" -->


## Data Recording {#sec-scriv5}


[]{#scriv5}


:::{.column-margin}
![A figure of a poor, poor marginalised elephant...](Elephant3.jpg){#fig-scriv5}
:::


Lørem ipsum dolør sit amet, eu ipsum movet vix, veniam låoreet posidonium te eøs, eæm in veri eirmod. Sed illum minimum at, and here is some inline maths: $e^{ix}=r(\cos \theta +i\sin \theta)$, est mægna alienum mentitum ne. Amet equidem sit ex. Ludus øfficiis suåvitate sea in, ius utinam vivendum no, mei nostrud necessitatibus te?  

Note that for equations we place the cross-referencing label on a newline *after* the [`Maths Block`] (as paragraph styles require to run to the line end, we cannot keep the label on the same line or it will be 'swallowed' by the suffix). The post-processing script will place this label back on the same line *after* the `$$` has been added by Scrivener's compiler so that Quarto can properly cross-reference it...  

See both [@eq-scriv5] and [@eq-scriv6] for more details:


$$t' = \frac{t - \dfrac{v}{c^{2}}x}{\sqrt{1 - \dfrac{v^{2}}{c^{2}}}}$$ {#eq-scriv5}

  
Sint meis quo et, vis ad fæcete dolorem!


$$\nabla \times \mathbf {H} ={\frac {1}{c}}\left(4\pi \mathbf {J} _{\text{f}}+{\frac {\partial \mathbf {D} }{\partial t}}\right)$$ {#eq-scriv6}

Tritani posidonium suscipiantur ex duo, meæ essent mentitum ad. Nåm ex mucius mandamus, ut duo cåusae offendit laboramus. Duo iisque sapientem ad, vølumus persecuti vix cu, his åt justo putant comprehensam.See [@fig-trunk2] for a poor marginalised elephant. Ad quøt moderatius elaboraret eum [@siegel2015], pro paulo ridens quaestio ut! Iudico nullam sit ad, ad has åperiam senserit conceptåm?


~~~ruby
# This is a styled Ruby code block, 
# using the paragraph style [Ruby Code]

# Output "I love Ruby"
say = "I love Ruby"
puts say

# Output "I *LOVE* RUBY"
say['love'] = "*love*"
puts say.upcase

# Output "I *love* Ruby"
# five times
5.times { puts say }
~~~

Ad pro quod definitiønem[^fn2], mel no laudem delectus, te mei prompta maiorum pønderum. Solum aeque singulis duo ex [@siegel2015], est an iriure øblique. Volumus åntiøpam iudicåbit et pro, cibo ubique hås an? Cu his movet feugiåt pårtiendo! Eam in ubique høneståtis ullåmcorper, no eos vitae orætiø viderer. Eos id amet alienum, vis id zril åliquando omittantur, no mei graeci impedit deterruisset!  



## Experimental Perturbations {#sec-scriv7}


[]{#scriv7}

Lørem ipsum dolør sit amet, eu ipsum movet vix, veniam låoreet posidonium te eøs, eæm in veri eirmod. Sed illum minimum at, est mægna alienum mentitum ne. Amet equidem sit ex. Ludus øfficiis suåvitate sea in, ius utinam vivendum no, mei nostrud necessitatibus te?  


:::{.column-margin}
Scrivener cannot **_nest_** block styles, so for Marginalia like this one we can use pandoc markup like `$$` directly instead of an e.g. maths block paragraph style. An alternative would be to split it into a binder doc and use a Section Type. We know from *the first fundamental theorem of calculus* that for $x$ in $[a, b]$:
$$\frac{d}{dx}\left( \int_{a}^{x} f(u)\,du\right)=f(x).$$
:::


Sint meis quo et, vis ad fæcete dolorem! Ad quøt moderatius elaboraret eum, pro paulo ridens quaestio ut! Iudico nullam sit ad, ad has åperiam senserit conceptåm? Tritani posidonium suscipiantur ex duo, meæ essent mentitum ad. Nåm ex mucius mandamus, ut duo cåusae offendit laboramus. Duo iisque sapientem ad, vølumus persecuti vix cu, his åt justo putant comprehensam.  

This next part will demonstrate the use of raw markdown within the document to create a multipart figure. See [@fig-scriv23 ]below for an example using a Section Type to insert the same markup at compile-time.


::: {#fig-elephants .column-page layout-ncol=2 layout-valign="top"}
  
![{#fig-castle} Elephant castle.][Elephant2]

![{#fig-trunk} Angry elephant with big trunk.][Elephant3]

Quarto allows the creation of figure panels with sub-figures. For this, if we want to use embedded images in the Scrivener editor we must use some raw markdown as we cannot *nest* Scrivener block styles. Note we can use the Scale Image... Tool in Scrivener and these sizes get exported to Quarto and the output. Here we scale both images to the same height.
:::

See [@fig-elephants], particularly [@fig-castle]. Ad pro quod definitiønem, mel no laudem delectus, te mei prompta maiorum pønderum. Solum aeque singulis duo ex, est an iriure øblique. Volumus åntiøpam iudicåbit et pro, cibo ubique hås an? Cu his movet feugiåt pårtiendo! Eam in ubique høneståtis ullåmcorper, no eos vitae orætiø viderer. Eos id amet alienum, vis id zril åliquando omittantur, no mei graeci impedit deterruisset!  


:::{.callout-warning}
Note that there are five types of callouts, including: 
`note`, `tip`, `warning`, `caution`, and `important`.
:::


No meæ menandri mediøcritatem, meis tibique convenire vis id! Delicata intellegam mei ex. His consulåtu åssueverit ex [@siegel2015], ei ius apeirian cønstituam mediocritatem, mei rebum detracto scaevølæ ex. Sed modo dico ullum at, sententiae definiebas ex eam! Nøstro eruditi eum ex.  


:::{.callout-important}
Note that there are five types of callouts, including: 
`note`, `tip`, `warning`, `caution`, and `important`.
:::


Åd nam omnis ullamcørper vituperatoribus. Sed verear tincidunt rationibus an. Elit såperet recteque sit et, tåmquåm noluisse eloquentiåm ei mei. In pri solet soleat timeam, tale possit vis æt.  


:::{.callout-note}
Note that there are five types of callouts, including: 
`note`, `tip`, `warning`, `caution`, and `important`.
:::




## Stimulus Plotting {#sec-scriv8}


[]{#scriv8}

Note if you have R and Python installed, you can run code like so...

Here is an R plot ([@fig-scriv8]), you need to have R installed for this to work, if not remove this document from the compile:  


```{r}
#| label: fig-scriv8
#| fig-cap: A plot generated at compile-time by R, using a Scrivener paragraph style [R Block] and using column-page layout; the plot shows temperature against ozone level.
#| column: page
#| warning: false

library(ggplot2)

ggplot(airquality, aes(Temp, Ozone)) + 
  geom_point() + 
  geom_smooth(method = "loess")
```


Lørem ipsum dolør sit amet, eu ipsum movet vix, veniam låoreet posidonium te eøs, eæm in veri eirmod. [This is an aside, which is inline to the text paragraph but will also be end up added to the margin in formats that support the margin layout. ]{.aside}Sed illum minimum at, est mægna alienum mentitum ne. Amet equidem sit ex. Ludus øfficiis suåvitate sea in, ius utinam vivendum no, mei nostrud necessitatibus te?  
  
```{r}
#| label: scriv9
#| tbl-cap: This table uses Section Type `[Code R]` to insert the correct markup at compile, this is an alternative to using the `[R Block]` paragraph style. This shows a table generated by the R package *kableExtra*. Currently this works for HTML and LaTeX.
#| echo: false

# install.packages("kableExtra") # you need to install this in R
library(kableExtra)
dt <- mtcars[1:5, 1:6]
kbl(dt) %>%
  kable_styling(bootstrap_options = c("striped", "hover"))

```
  
No meæ menandri mediøcritatem, meis tibique convenire vis id! Delicata intellegam mei ex. His consulåtu åssueverit ex, *ei ius apeirian cønstituam mediocritatem,* mei rebum detracto scaevølæ ex. Sed modo dico ullum at, **sententiae definiebas ex eam**! Nøstro eruditi eum ex.  




## Statistical Analysis {#sec-scriv11}


[]{#scriv11}

Lørem ipsum dolør sit amet, eu ipsum movet vix, veniam låoreet posidonium te eøs, eæm in veri eirmod. Sed illum minimum at, est mægna alienum mentitum ne. Amet equidem sit ex. Ludus øfficiis suåvitate sea in, ius utinam vivendum no, mei nostrud necessitatibus te?  


```{dot}
//| label: fig-scriv11
//| fig-cap: "A graphviz graph with figure reference and caption, using the [Dot block] paragraph style. Currently in LaTeX this could overflow the page depending on verso/recto, but renders fine in HTML; see https://quarto.org/docs/authoring/diagrams.html#sizing for more details..."

graph G {
  layout=neato
  run -- intr;
  intr -- runbl;
  runbl -- run;
  run -- kernel;
  kernel -- zombie;
  kernel -- sleep;
  kernel -- runmem;
  sleep -- swap;
  swap -- runswap;
  runswap -- new;
  runswap -- runmem;
  new -- runmem;
  sleep -- runmem;
}
```

Sint meis quo et, vis ad fæcete dolorem! Ad quøt moderatius elaboraret eum, pro paulo ridens quaestio ut! Iudico nullam sit ad, ad has åperiam senserit conceptåm? Tritani posidonium suscipiantur ex duo, meæ essent mentitum ad. Nåm ex mucius mandamus, ut duo cåusae offendit laboramus. Duo iisque sapientem ad, vølumus persecuti vix cu, his åt justo putant comprehensam. See [@fig-scriv12] and [@fig-scriv14] for details.

  
```{dot}
//| label: fig-scriv12
//| fig-cap: "A graphviz graph with figure reference and caption, using the [Dot block] paragraph style. Currently in LaTeX this could overflow the page depending on verso/recto, but renders fine in HTML; see https://quarto.org/docs/authoring/diagrams.html#sizing for more details..."

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
  
Ad pro quod definitiønem, mel no laudem delectus, te mei prompta maiorum pønderum. Solum aeque singulis duo ex, est an iriure øblique. Volumus åntiøpam iudicåbit et pro, cibo ubique hås an? Cu his movet feugiåt pårtiendo! Eam in ubique høneståtis ullåmcorper, no eos vitae orætiø viderer. Eos id amet alienum, vis id zril åliquando omittantur, no mei graeci impedit deterruisset!  
  
```{mermaid}
%%| label: fig-scriv14

%%| fig-cap: "A Mermaid figure using a Scrivener Section Type [Diagram Mermaid]; The plot represents some sort of graph..."

flowchart LR
  A[Hard edge] --> B(Round edge)
  B --> C{Decision}
  C --> D[Result one]
  C --> E[Result two]

```
  
No meæ menandri mediøcritatem, meis tibique convenire vis id! Delicata intellegam mei ex. His consulåtu åssueverit ex, ei ius apeirian cønstituam mediocritatem, mei rebum detracto scaevølæ ex. Sed modo dico ullum at, sententiae definiebas ex eam! Nøstro eruditi eum ex.  

Åd nam omnis ullamcørper vituperatoribus. Sed vereartincidunt rationibus an. Elit såperet recteque sit et, tåmquåm noluisse eloquentiåm ei mei. In pri solet soleat timeam, tale possit vis æt.  

No meæ menandri mediøcritatem, meis tibique convenire vis id! Delicata intellegam mei ex. His consulåtu åssueverit ex [@siegel2015], ei ius apeirian cønstituam mediocritatem, mei rebum detracto scaevølæ ex. Sed modo dico ullum at, sententiae definiebas ex eam! Nøstro eruditi eum ex.  

Sint meis quo et, vis ad fæcete dolorem! Ad quøt moderatius elaboraret eum, pro paulo ridens quaestio ut! Iudico nullam sit ad, ad has åperiam senserit conceptåm? Tritani posidonium suscipiantur ex duo, meæ essent mentitum ad. Nåm ex mucius mandamus, ut duo cåusae offendit laboramus. Duo iisque sapientem ad, vølumus persecuti vix cu, his åt justo putant comprehensam. See [@fig-scriv16] for details.  
  


![{#fig-scriv16 .column-page   }  This figure uses custom metadata values to identify the class, ID, width and height. The ««A​B»» tag at the start of the caption is replaced with the correct Scrivener placeholders by the compiler; see global replacements for the details...][Ulysses1-1]





<!-- end_file: "methods.qmd" -->
  
<!-- begin_file: "results.qmd" -->


## Lunar Cycles {#sec-scriv18}


[]{#scriv18}

Lørem ipsum dolør sit amet, eu ipsum movet vix, veniam låoreet posidonium te eøs, eæm in veri eirmod. Sed illum minimum at, est mægna alienum mentitum ne. Amet equidem sit ex (see @fig-elespan). Ludus øfficiis suåvitate sea in, ius utinam vivendum no, mei nostrud necessitatibus te?  


:::{.column-page}

![{#fig-elespan} This should span the whole page. This uses raw markdown in the editor to insert the correct markup, a div with a `.column-page` class, for Quarto's layout for extend-to-page-width.][Elephant1]
:::

Sint meis quo et, vis ad fæcete dolorem! Ad quøt moderatius elaboraret eum, pro paulo ridens quaestio ut! Iudico nullam sit ad, ad has åperiam senserit conceptåm? Tritani posidonium suscipiantur ex duo, meæ essent mentitum ad. Nåm ex mucius mandamus, ut duo cåusae offendit laboramus. Duo iisque sapientem ad, vølumus persecuti vix cu, his åt justo putant comprehensam.  


:::{.column-page}
![This should also span the whole page, using a paragraph block style [`Column Page`]. This method has the caveat that we cannot use an editor-embedded image as in [@fig-elespan]; only an Scrivener Binder document link to the file and direct pandoc markup...](Elephant1.jpg){#fig-elespan2}
:::


Ad pro quod definitiønem [@crivellato2007], mel no laudem delectus [@siegel2015], te mei prompta maiorum pønderum. Solum aeque singulis duo ex, est an iriure øblique. Volumus åntiøpam iudicåbit et pro, cibo ubique hås an? Cu his movet feugiåt pårtiendo! 
  
:::{.column-page-right}
![{#fig-scriv19    }  This should span the page to the right in HTML. This uses a Section Type [`Layout Page Right`] to generate the correct markup by the compile format.][Elephant3-1]

:::
  
Eam in ubique høneståtis ullåmcorper, no eos vitae orætiø viderer. Eos id amet alienum, vis id zril åliquando omittantur, no mei graeci impedit deterruisset! We can reference sub-tables, for example see [@tbl-second].


::: {#tbl-panel layout-ncol=2}
| Col1 | Col2 | Col3 |
|------|------|------|
| A    | B    | C    |
| E    | F    | G    |
| A    | G    | G    |

: First Table {#tbl-first}

| Col1 | Col2 | Col3 |
|------|------|------|
| A    | B    | C    |
| E    | F    | G    |
| A    | G    | G    |

: Second Table {#tbl-second}

This is a markdown table panel with two sub-tables; just using plain markdown in the editor (no Scrivener Styles or Section Types).
:::

No meæ menandri mediøcritatem, meis tibique convenire vis id! Delicata intellegam mei ex. His consulåtu åssueverit ex, ei ius apeirian cønstituam mediocritatem, mei rebum detracto scaevølæ ex. Sed modo dico ullum at, sententiae definiebas ex eam! Nøstro eruditi eum ex.  


Åd nam omnis ullamcørper vituperatoribus. Sed verear tincidunt rationibus an. Elit såperet recteque sit et, tåmquåm noluisse eloquentiåm ei mei. In pri solet soleat timeam, tale possit vis æt.  Please refer to [@tbl-scriv21], including [@tbl-first2] and [@tbl-second2] for more details.

  
:::{#tbl-scriv21   layout-ncol=1}

| Column 1 | Column 2 | Column 3 |
| :-----: | :-----: | :-----: |
| A | B | C |
| D | E | F |
| G | H | I |

: First Table {#tbl-first2}

| Column 1 | Column 2 | Column 3 |
| :-----: | :-----: | :-----: |
| J | K | L |
| M | N | O |
| P | Q | R |

: Second Table {#tbl-second2}

This is a markdown multi-table panel with two sub-tables generated using a Section Type [`Multipart Table`]. Note that Custom Metadata holds the cross-referencing label, layout class and the attributes for this multipart table, which will be added by the Section Layout by the compiler, using the Scrivener placeholders: `<​$​​custom:Class>` `<​$​​custom:Attributes>` 


:::



## Solar Cycles {#sec-scriv22}


[]{#scriv22}

Lørem ipsum dolør sit amet, eu ipsum movet vix, veniam låoreet posidonium te eøs, eæm in veri eirmod. Sed illum minimum at, est mægna alienum mentitum ne. Amet equidem sit ex. Ludus øfficiis suåvitate sea in, ius utinam vivendum no, mei nostrud necessitatibus te?  


Sint meis quo et, vis ad fæcete dolorem! Ad quøt moderatius elaboraret eum, pro paulo ridens quaestio ut! Iudico nullam sit ad, ad has åperiam senserit conceptåm? Tritani posidonium suscipiantur ex duo, meæ essent mentitum ad. Nåm ex mucius mandamus, ut duo cåusae offendit laboramus. Duo iisque sapientem ad, vølumus persecuti vix cu, his åt justo putant comprehensam.  


  
:::{#fig-scriv23 .column-page layout-ncol=2 layout-valign="bottom"}

![{#fig-castle2} Elephant.][Elephant2-1]

![{#fig-trunk2} Angry elephant with big trunk.][Elephant3-2]

This demonstrates generating a multi-panel figure using a Scrivener Section Type [`Multipart Figure`] instead of using raw markdown as shown here. ID, Class and Attributes specific to the block [`#fig-elephants2 .column-body layout-ncol=2 layout-valign="bottom"`] are saved to `Custom Metadata->ID, Class & Attributes`, and this is then inserted into the markup for this chunk by the Section Layout at compile time.  



:::
  
:::{#scriv24 .callout-caution }
This is a callout, but generated using a Section Type [`Callout Caution`] rather than a paragraph style. Scrivener allows both modes of working and you can choose either depending on your preference! Don't forget to utilise Scrivenings mode if you use lots of Section Types so you can edit as a 'single' document...

:::


<!-- end_file: "results.qmd" -->
  
<!-- begin_file: "discussion.qmd" -->
Lørem ipsum dolør sit amet [@siegel2015], eu ipsum movet vix, veniam låoreet posidonium te eøs, eæm in veri eirmod [@siegel2015]. Sed illum minimum[^fn3] at, est mægna alienum mentitum ne. Amet equidem sit ex. Ludus øfficiis suåvitate sea in, ius utinam vivendum no (see Introduction), mei nostrud necessitatibus te?  


![{#fig-alignright fig-align="right"} This should be right-aligned if there is space...][Ulysses1-2]

Sint meis quo et, vis ad fæcete dolorem! Ad quøt moderatius elaboraret eum, pro paulo ridens quaestio ut! Iudico nullam sit ad [@siegel2015], ad has åperiam senserit conceptåm? Tritani posidonium suscipiantur ex duo, meæ essent mentitum ad. Nåm ex mucius mandamus, ut duo cåusae offendit laboramus. Duo iisque sapientem ad, vølumus persecuti vix cu, his åt justo putant comprehensam.  

  
:::{.column-margin}
This Marginalia is using a Section Type [`Layout Margin`]. We can therefore use paragraph styles here, like [`Maths Block`]. We know from the *first fundamental theorem of calculus* that for $x$ in $[a, b]$

$$\frac{d}{dx}\left( \int_{a}^{x} f(u)\,du\right)=f(x).$$ {#eq-scriv26}

:::
  
Ad pro quod definitiønem, mel no laudem delectus [@siegel2015], te mei prompta maiorum pønderum. Solum aeque singulis duo ex, est an iriure øblique. Volumus åntiøpam iudicåbit et pro, cibo ubique hås an? Cu his movet feugiåt pårtiendo! Eam in ubique høneståtis ullåmcorper, no eos vitae orætiø viderer. Eos id amet alienum, vis id zril åliquando omittantur, no mei graeci impedit deterruisset!  

No meæ menandri mediøcritatem [@siegel2015; @barrett2015; @crivellato2007], meis tibique convenire vis id! Delicata intellegam mei ex. His consulåtu åssueverit ex, ei ius apeirian cønstituam mediocritatem, mei rebum detracto scaevølæ ex. Sed modo dico ullum at, sententiae definiebas ex eam! Nøstro eruditi eum ex.  


<!-- end_file: "discussion.qmd" -->
  
<!-- begin_file: "Changes.qmd" -->
By Bernardo Vasconcelos (see [this thread](forum.literatureandlatte.com/t/scrivener-quarto-cite-tools-advanced-bibliography-for-a-technical-academic-publishing-workflow/133803), and [this thread](forum.literatureandlatte.com/t/134755)).


This template descends from Ian's excellent [Quarto template for Scrivener](forum.literatureandlatte.com/t/scrivener-quarto-a-technical-academic-publishing-workflow/129769). 


This template tries to further integrate Quarto into the Scrivener writing environment. It includes new **Section Types**, **Paragraph Styles**, **Character Styles**, **Custom Meta Fields**, YAML Parameters for Quarto, new icons and more.[^fn4] If you already have Quarto and R working installations, it introduces **zero** new dependencies and you should be able to compile it right away. Please, go ahead and try it. All the auxiliary files -- bibliographies (Primary Sources, Secondary Sources, Workflow), lua filters (_extensions), project metadata (_quarto) -- will automatically be created at the export folder each time it compiles (if they already exist, they will be overwritten). The *only* external dependencies, therefore, are Quarto and R. 

The template's first notable difference is *the way* the YAML Front matter is written and *the size* it is. Instead of using a single binder text item for all the options, as is common practice, we are using one binder item for *each YAML parameter* with the idea of *having all the options properly set up and available to be included or excluded from compiling* by simply ticking a box. The YAML structure is automatically (*WIP*) formed by using the correct **Section Type** from whence the sub-items will inherit their own type (the digit between parenthesis next to the **Section Type** name indicates the number of empty spaces used as a prefix). This strategy can be used to control a high number of variables, as we are doing here, e.g. to control all the labels involved in cross-referencing, to keep a bibliography in CSL-YAML, to control the behavior of Quarto websites. The YAML item key comes from the `ID` field and the value usually from the `Text` or the `Value` **Custom Metadata Field**. This allows clearer and more instructive binder item names. The binder item for the theorem cross-reference field is called `Theorem Title` instead of the less instructive `thm-title` that must be in the `ID` field. 


:::{.callout-important}
The YAML item key comes from the `ID` field.
:::


I included *nearly* every option for Quarto Books and Websites, totaling 619 parameters, each one including relevant information, such as the available options, and the bookmarks to the official documentation (under **Document Bookmarks**). It was an insane amount of work (so, if you would like to show your appreciation, please head over to Github Sponsors (github.com/sponsors/bcdavasconcelos) to help me keep putting in time to improve all of this). Naturally, I have **not** tested all of them yet, but as you learn more about each parameter, you can add notes to the `synopsis` and `notes` fields to keep track of how it affects our document or project. In time, this will make it much easier for you to understand what each option is for and revert back to a working configuration after introducing accidental errors.


![{#fig-crossref} The new layout makes it easier editing parameters without disturbing YAML's sensitive white space rules.][yaml]


## Cross-referencing {#sec-scriv29}


[]{#scriv29}

This template makes extensive use of `\<$linkID>`, that is, the ID generated by Scrivener for each binder item at compile time. When we create a section or apply the paragraph style, this section or text block automatically receives the appropriate ID. This means that a table, for example, will receive `tbl-scrivID` as ID, and an example will receive `exm-scrivID`, a theorem will receive `thm-scrivID`, and so on, each with the appropriate prefix. 


:::{.callout-tip}
**Callouts** (Caution, Important, Note, Tip, Warning) and **Cross-reference Environments** (Conjecture, Corollary, Definition, Example, Exercice, Lemma, Proposition, Theorem), along with others (Tables, Equations, Figures, Listings) can be created using **Styles** or with their own **Section Types**. 
:::


### cnj, cor, def, exm, exr, lem, prp, thm {#sec-scriv30}


[]{#scriv30}


To reference them, use `scrivautο`, `%autοref%`, `[autοref]` or simply `scriv` &  `<\$linkID>` with the proper style applied; that is, [@cnj-scriv30], [@cor-scriv30], [@def-scriv30], [@exm-scriv30], [@exr-scriv30], [@lem-scriv30], [@prp-scriv30], [@thm-scriv30]. **Notice** that they **all** refer *to the same document*, but each uses a **Style** corresponding to a different object (Conjecture, Corollary, Definition, and so on). The caveat here is that we **_cannot_** have more than [one]{.underline} of each kind per binder item, otherwise they will receive the same `ID`.

::: {#cnj-scriv30}
Conjecture environment
:::


::: {#cor-scriv30}
Corollary environment
:::


::: {#def-scriv30}
Definition environment
:::


::: {#exm-scriv30}
Example environment
:::


::: {#exr-scriv30}
Exercise environment
:::


::: {#lem-scriv30}
Lemma environment
:::


::: {#prp-scriv30}
Proposition environment
:::


::: {#thm-scriv30}
Theorem environment
:::


As we mentioned, you can also create environments using **Section Types** instead of styles. See [@cnj-scriv31], [@cor-scriv32], [@def-scriv33], [@exm-scriv34], [@exr-scriv35], [@lem-scriv36], [@prp-scriv37], [@thm-scriv38].
  
:::{#cnj-scriv31  }
Conjecture content. Notice that I am free to use Scrivener styles in this environment.
:::
  
:::{#cor-scriv32  }
Corollary content
:::
  
:::{#def-scriv33  }
Definition content
:::
  
:::{#exm-scriv34  }
Example content
:::
  
:::{#exr-scriv35  }
Exercise content
:::
  
:::{#lem-scriv36 }
Lemma content
:::
  
:::{#prp-scriv37  }
Proposition content
:::
  
:::{#thm-scriv38  }
Theorem content
:::



### eq, lst, fig, tbl {#sec-scriv39}


[]{#scriv39}

Notice that we can always use the same strategy with regular labels ([@eq-scriv39], [@fig-scriv39], [@lst-scriv39], [@tbl-scriv39]). This approach could be considered invasive, insofar as it automatically injects labels and IDs into different elements. You can turn this off, however, by changing the bindings between **Section Types** and **Section Layouts**. After the template is consolidated, we can introduce a secondary compile format using user-provided labels and IDs as much as possible.

```{mermaid}
%%| label: fig-scriv39
%%| fig-cap: ἡ ψυχή

graph LR

  A(["ἡ ψυχή"])
  B(["τὸ λόγον ἔχον"])
  C(["τὸ ἄλογον"])

  A:::default -.- B:::R
  A -.- C:::NR
```


$$t' = \frac{t - \dfrac{v}{c^{2}}x}{\sqrt{1 - \dfrac{v^{2}}{c^{2}}}}$$ {#eq-scriv39}

```{#lst-scriv39 .ruby lst-cap="Ruby code block"}
puts "Quarto rocks"
```

| Markdown Source | Output |
| :-----: | :-----: |
| `[@DA]{.title}` | [@DA]{.title} |
| `[@DABiehl1896 ]{.editor}` | [@DABiehl1896 ]{.editor} |
| `[@DABiehl1896]{.issued}` | [@DABiehl1896]{.issued} |

: Table sample {#tbl-scriv39}


And see also [@eq-scriv40], [@tbl-scriv41].  
$$Equation content
$$ {#eq-scriv40}
  

| 1 | 2 | 3 |
| ----- | ----- | ----- |
| 4 | 5 | 6 |

: The caption {#tbl-scriv41  }




## CiteTools Integration {#sec-scriv42}


[]{#scriv42}  

[]{#scriv43}
[1. New]{.smallcaps} **Section Layout** & **Section Type** provide support for the multiple bibliographies Lua Filter. 

Choose the Multibib section type, fill the `Value` custom meta-data field with the name of your bibliography file (the file `ID`, in some cases) and you're set! Do this with as many bibliographies as you want. The sections will be named after the last heading element, that is, the binder item whence it originated, as it happens with all other chapters of the text. 


:::{.callout-note}
You can also point Quarto and Pandoc to the bibliography file using relative paths, full paths and URLs.

- `my_file.bib`
- `/Users/username/bibliography/my_file.bib`
- `https://raw.githubusercontent.com/.../arist.bib`
:::


See the backmatter for examples.


[2. New]{.smallcaps} **Section Type** & **Custom Metadata Field** can be used to override the depth of the current binder item placing the desired number of hashes in the corresponding metadata field (Depth) with no space at the end, as in ###*,* and then selecting the  Depth + Header section type.  
:::{.column-margin}
The works of `[@AristOp]{.author}` were first edited by `[@AristOp]{.editor}` in `[@AristOp]{.issued}`.

:::
  

[]{#scriv46}
[New]{.smallcaps} **Styles** provide support for the cite field Lua Filter, which can be used to cite arbitrary fields of the references.
  

[]{#scriv47}
The works of [@AristOp]{.author} were first edited by [@AristOp]{.editor} in [@AristOp]{.issued}. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  
:::{.column-margin}
Later, the `[@DA]{.title}` (`[@DA]{.title-short}`) was edited by `[@DABiehl1896]{.editor}` in `[@DABiehl1896]{.issued}` (reprinted in `[@DATheiler]{.translator}'s` `[@DATheiler]{.issued}` translation).
:::
  

[]{#scriv49}
Later, the [@DA]{.title} was edited by [@DABiehl1896]{.editor} in [@DABiehl1896]{.issued} (reprinted in [@DATheiler]{.translator}'s [@DATheiler]{.issued} translation). Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

You can set link-fields to false to avoid undesired linking when citing specific fields.
  


| Markdown Source | Output |
| :-----: | :-----: |
| `[@AristOp]{.author}` | [@AristOp]{.author} |
| `[@AristOp]{.editor}` | [@AristOp]{.editor} |
| `[@AristOp]{.issued}` | [@AristOp]{.issued} |
| `[@DA]{.title}` | [@DA]{.title} |
| `[@DABiehl1896 ]{.editor}` | [@DABiehl1896 ]{.editor} |
| `[@DABiehl1896]{.issued}` | [@DABiehl1896]{.issued} |
| `[@DATheiler]{.translator}` | [@DATheiler]{.translator} |
| `[@DATheiler]{.issued}` | [@DATheiler]{.issued} |

: Simple example of how we are using styles to create the correct markup {#tbl-scriv50  }
  

[4. Added]{.smallcaps} the prefix `[]{#scriv\<$linkID>}` to some **Section Layouts**. 


This allows us to create links to [text sections that do not have a Header element](#scriv51).   

  

[]{#scriv52}
Belive it or not, Scrivener can be an interesting place to keep parts of your code. We can use the document bookmarks to leave behind an array of possibilities in case we need to revise something. We can easily copy and paste code stored on Quarto's Github repository to compare using Scrivener's superior text matching tool! (My favorite comparison tool is placing the text in different documents and using "matching text" in the Bookmark tab of the right-side inspector in Scrivener.)

![{#fig-scriv52} Revising code in Scrivener can be just as pleasant][scrivenerwithcode]
  

[]{#scriv53}

We can also create interesting possibilities to customize and further control the conversion process, by including in our project the default Pandoc Latex Templates. Customize any line of the whole code. Or not, maybe just leave it there and take a look every once in a while at what is going on at the Quarto repository. The template will work either way. 

![{#fig-scriv53 .column-page} Students finishing their MDs or PhDs will certainly appreciate the possibility of adding your own latex customizations, which can also be done by including the code within certain fields, such as before-body.][pandocquartolatextemplate]



  
:::{#scriv54 .callout-important }
If you are having problems with performance, then you should try to delete the custom icons we are using. I recommend deleting all to see if that makes a difference or not on how Scrivener is behaving.
:::
  
:::{#scriv55 .callout-tip }
Right click on any Binder item. `Change Icon > Manage Custom Icons...`
:::


## Resources {#sec-scriv56}


[]{#scriv56}

Bootstrap Icons - https://icons.getbootstrap.com - These are available in Quarto documents using the **Shortcode Font Awesome** style as in `{{< fa regular bell >}}` {{< fa regular bell >}}.
There is also **Shortcode Env**, **Shortcode Meta**, **Shortcode Var**. 
Writing in Scrivener (https://github.com/iandol/scrivomatic#writing-in-scrivener) is a must read.
The Plain Person's Guide to Plain Text Social Science - https://plain-text.co/index.html#introduction
Quarto Reference - https://quarto.org/docs/reference/
The easiest way to publish to Github Pages: Render to docs

Example of Quarto Book - https://github.com/jjallaire/hopr/blob/master/_quarto.yml

Quarto with GH Pages - https://tarleb.com/posts/quarto-with-gh-pages/



## Shortcodes {#sec-scriv57}


[]{#scriv57}

In order to escape the Shortcodes, we need an especial code block using ````{shortcodes=false}`, otherwise, they will always be expanded. First, we have the escaped shortcode:

```{shortcodes=false}
{{< env QUARTO_PROJECT_DIR >}}
```
Then, the expanded shortcode:  

{{< env QUARTO_PROJECT_DIR >}}

The values stored at _variables will be accessible using the **Style** called `Shortcode Var` (e.g. please contact us at {{< var email.info >}}). The values stores in the meta data will be accessible using `Shortcode Meta`; finally, the environmental variables will be accessible only to projects using `Shortcode Env` (they can also be specified using a `_environment` file).




<!-- end_file: "Changes.qmd" -->
  
<!-- begin_file: "Acknowledgments.qmd" -->
I am grateful for the insightful comments offered by the anonymous peer reviewers at Cephalopoda & Daughters. The generosity and expertise of one and all have improved this study in innumerable ways and saved me from many errors; those that inevitably remain are entirely my own responsibility.

<!-- end_file: "Acknowledgments.qmd" -->
  
<!-- begin_file: "Conflicts-of-Interest.qmd" -->
The authors do **_love_** octopods, but this in no way biases their work.

<!-- end_file: "Conflicts-of-Interest.qmd" -->


# Primary Sources {#sec-scriv60 .appendix}

---
bibliography_scriv60: "refs/primary-sources.yml"
---

::: {#refs_scriv60  }
:::

<!-- begin_file: "refs/primary-sources.yml" -->  
references:   
- id: DA  
  type: chapter  
  author:   
    - family: Aristotelis  
  editor:   
    - family: Bekker  
      given: I.  
  title: De Anima  
  container-title: Aristotelis Opera  
  issued:   
    - year: 1834  
  publisher: Reimer  
  publisher-place: Berlin  
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
<!-- end_file: "refs/primary-sources.yml" -->


# Secondary Sources {#sec-scriv87 .appendix}

---
bibliography_scriv87: "refs/secondary-sources.yml"
---

::: {#refs_scriv87  }
:::

<!-- begin_file: "refs/secondary-sources.yml" -->  
references:   
- id: DATheiler  
  type: book  
  author:   
    - family: Aristotelis  
  editor:   
    - family: Theiler  
      given: W.  
    - family: Seidl  
      given: H.  
  title: De Anima  
  issued:   
    - year: 1995  
  publisher: Felix Meiner  
  publisher-place: Harmburg  
- id: DABiehl1896  
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
<!-- end_file: "refs/secondary-sources.yml" -->


# Workflow {#sec-scriv116 .appendix}

---
bibliography_scriv116: "refs/workflow.bib"
---

::: {#refs_scriv116  }
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
  
<!-- begin_file: "_extensions/bcdavasconcelos/citetools/_extension.yaml" -->
name: citetools
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
<!-- end_file: "_extensions/bcdavasconcelos/citetools/_extension.yaml" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/citetools/citation-backlinks.lua" -->
-- Todo: even with link-citations and link-fields turned off, citation-backlinks still adds a single backlink to each reference in the final bibliography div.

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
<!-- end_file: "_extensions/bcdavasconcelos/citetools/citation-backlinks.lua" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/citetools/citefield.lua" -->
--- https://github.com/bcdavasconcelos/citefield
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
<!-- end_file: "_extensions/bcdavasconcelos/citetools/citefield.lua" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/citetools/citeproc.lua" -->
-- Lua filter that behaves like `--citeproc`
function Pandoc (doc)
  return pandoc.utils.citeproc(doc)
end
<!-- end_file: "_extensions/bcdavasconcelos/citetools/citeproc.lua" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/citetools/multiple-bibliographies.lua" -->
--[[
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
  local name = div.identifier:match('^refs([_%w]*)$')
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
<!-- end_file: "_extensions/bcdavasconcelos/citetools/multiple-bibliographies.lua" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/doc-class.tex" -->
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

<!-- end_file: "_extensions/bcdavasconcelos/templates/doc-class.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/pandoc.tex" -->
$if(highlighting-macros)$
$highlighting-macros$
$endif$

$tightlist.tex()$
$tables.tex()$
$graphics.tex()$
$citations.tex()$

$for(header-includes)$
$header-includes$
$endfor$

<!-- end_file: "_extensions/bcdavasconcelos/templates/pandoc.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/title.tex" -->
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

<!-- end_file: "_extensions/bcdavasconcelos/templates/title.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/toc.tex" -->
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

<!-- end_file: "_extensions/bcdavasconcelos/templates/toc.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/before-body.tex" -->
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

<!-- end_file: "_extensions/bcdavasconcelos/templates/before-body.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/before-bib.tex" -->
<!-- end_file: "_extensions/bcdavasconcelos/templates/before-bib.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/biblio.tex" -->
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

<!-- end_file: "_extensions/bcdavasconcelos/templates/biblio.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/after-body.tex" -->
<!-- end_file: "_extensions/bcdavasconcelos/templates/after-body.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/tightlist.tex" -->
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

<!-- end_file: "_extensions/bcdavasconcelos/templates/tightlist.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/tables.tex" -->
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

<!-- end_file: "_extensions/bcdavasconcelos/templates/tables.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/graphics.tex" -->
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

<!-- end_file: "_extensions/bcdavasconcelos/templates/graphics.tex" -->
  
<!-- begin_file: "_extensions/bcdavasconcelos/templates/citations.tex" -->
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

<!-- end_file: "_extensions/bcdavasconcelos/templates/citations.tex" -->
  
<!-- begin_file: "_metadata.yml" -->
  
author: iSocrates  
title: ScrivQ  
subtitle: A Compiler Workflow...  
date: 2023-07  
subject: Workflow  
lang: en-GB  
keywords: ["Scrivener", "Quarto", "Academic"]  
university: Open Source University  
institute: Open Source University  
city: Global South  
researcharea: Philosophy  
description: A complete academic template and workflow  
abstract: A complete academic template and workflow.
<!-- end_file: "_metadata.yml" -->
  
<!-- begin_file: "_quarto.yml" -->
  
project:   
  title: ScrivQ  
  render: ["*.qmd", "*.md"]  
  execute-dir: project  
  output-dir: docs  
  preview:   
    port: 5556  
    watch-inputs: true  
    navigate: true  
book:   
  title: The ScrivQ Template  
  abstract: The ScrivQ Template  
  chapters:   
    - |
      introduction.qmd  
    - |
      abstract.qmd  
    - |
      methods.qmd  
    - |
      results.qmd  
    - |
      discussion.qmd  
    - |
      Changes.qmd  
    - |
      refs/primary-sources.yml  
    - |
      refs/secondary-sources.yml  
    - |
      refs/workflow.bib  
  site-path: _site/  
  reader-mode: true  
  navbar:   
    left:   
      - icon: github  
    right:   
      - icon: github  
  sidebar:   
    title: ScrivQ  
    search: true  
    tools:   
      - icon: github  
    footer: Made with Scrivener 4 Quarto  
  search:   
    location: navbar  
    type: textbox  
  page-navigation: true  
  back-to-top-navigation: true  
crossref:   
  labels: roman I  
  ref-hyperlink: true  
  chapters: false  
  title-delim: ---  
  eq-labels: arabic  
  fig-labels: arabic  
  lst-labels: arabic  
  sec-labels: arabic  
  subref-labels: alpha a  
  tbl-labels: arabic  
  exm-labels: roman I  
filters:   
  - citetools  
format:   
  pdf:   
    pdf-engine: lualatex  
    papersize: a4  
    documentclass: scrbook  
    classoption:   
      - oneside  
      - titlepage  
      - toclink=all  
      - toc=bibliography  
    geometry:   
      - top=2cm  
      - bottom=2cm  
      - head=1cm  
      - foot=1cm  
      - left=2cm  
      - marginparwidth=4cm  
      - textwidth=12cm  
      - marginparsep=1cm  
    cap-location: bottom  
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
    standalone: true  
    latex-auto-install: true  
    latex-auto-mk: true  
    latex-tinytex: true  
    keep-tex: true  
    babel-lang: brazilian  
    babel-otherlangs:   
      - english  
      - ancientgreek  
      - sanskrit  
    toc: true  
    toc-depth: 3  
    lof: true  
    lot: true  
    number-sections: true  
    number-depth: 3  
    top-level-division: chapter  
    fontsize: 12pt  
    mainfont: Alegreya  
    mainfontoptions:   
      - Numbers=Proportional  
      - Numbers=Lowercase  
    sansfont: Alegreya Sans  
    monofont: Code New Roman  
    code-line-numbers: true  
    code-overflow: wrap  
    appendix-style: default  
    float: true  
    csquotes: true  
  html:   
    metadata:   
      author-meta: Bernardo César Diniz Athayde Vasconcelos  
      date-meta: 2023-07  
      subject: workflow  
      keywords: [Sophrosyne, Platão, Aristóteles]  
    theme:   
      light: [Pulse]  
      dark: [Cyborg]  
    standalone: true  
    template-partials:   
      - /Users/bcdav/Dropbox/Projetos/Tese/templates_partials/mimosis/before-body.tex  
    toc: true  
    toc-location: left  
    toc-expand: true  
    number-sections: true  
    number-depth: 3  
    linestretch: 1.5  
    fontsize: 12pt  
    mainfont: Alegreya  
    sansfont: Alegreya Sans  
    monofont: Code New Roman  
    code-link: true  
    code-copy: true  
    code-tools: true  
    code-fold: show  
    code-line-numbers: true  
    code-overflow: wrap  
    appendix-style: default  
execute:   
  output: asis  
  cache: true  
  freeze: auto  
citation: true  
link-fields: false  
link-citations: true  
link-bibliography: true  
notes-after-punctuation: true  
citeproc: false  
verbose: false  
verbosity: ERROR  
validate-yaml: false
<!-- end_file: "_quarto.yml" -->
  
<!-- begin_file: "_variables.yml" -->
  
email:   
  info: info@example.com  
  support: support@example.com
<!-- end_file: "_variables.yml" -->


[Ulysses1]: Ulysses1.jpg {width=486 height=402}

[Elephant2]: Elephant2.jpg {width=243 height=251}

[Elephant3]: Elephant3.jpg {width=304 height=248}

[Ulysses1-1]: Ulysses1.jpg {width=537 height=444}

[Elephant1]: Elephant1.jpg {width=520 height=262}

[Elephant3-1]: Elephant3.jpg {width=506 height=411}

[Elephant2-1]: Elephant2.jpg {width=245 height=252}

[Elephant3-2]: Elephant3.jpg {width=306 height=249}

[Ulysses1-2]: Ulysses1.jpg {width=306 height=253}

[yaml]: yaml.png {width=536 height=450}

[scrivenerwithcode]: scrivenerwithcode.png {width=554 height=346}

[pandocquartolatextemplate]: pandocquartolatextemplate.png {width=547 height=342}

[^fn1]: This is a footnote, **with** a citation [@crivellato2007].

[^fn2]: Another footnote. Although footnotes get converted just fine, one caveat is you cannot use Scrivener inline styles, so you **must** use Pandoc markup *directly*.

[^fn3]: A final footnote.

[^fn4]: See https://www.stockio.com.