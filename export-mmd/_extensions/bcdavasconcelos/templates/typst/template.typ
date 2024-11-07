#import "_extensions/bcdavasconcelos/templates/typst/lib.typ": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, update-heading-image

#show: project.with(
  title: "A sophrosyne em Aristóteles",
  subtitle: "Uma discussão sobre as origens da formulação aristotélica do problema passando por Homero e Platão",
  date: "Anno scolastico 2023-2024",
  author: "Bernardo C. D. A. Vasconcelos",
  mainColor: rgb("#F36619"),
  lang: "en",
  listOfFigureTitle: "Lista de Figuras",
  listOfTableTitle: "Lista de Tabelas",
  supplementChapter: "Capítulo",
  supplementPart: "PARTE",
  part_style: 0,
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

