# Remark Templates

Templates for [remark.js](https://remark.js.org/) markdown processor. Used by
3mdeb to generate presentations, reports, and other documents with markdown
text tracked in git.

## Available templates

Following templates are currently available in this repository:

* `3mdeb-catalogue-template`
    - template for creating 3mdeb service catalogues
* `3mdeb-pet-presentation-template`
    - template for 3mdeb PET presentations
* `3mdeb-presentation-template`
    - template for generic 3mdeb presentations (such as technical conferences,
    or internal presentations)
* `3mdeb-report-template`
    - A4 report template - can be used for creating A4-sized PDFs with various
    technical reports
* `3mdeb-training-presentation-template`
    - template for generic 3mdeb training presentations (should be avoided for
     new content - use either PET or OST2)
* `dasharo-presentation-template`
    - template for various Dasharo-related presentations

## Markdown syntax

Apart from the pretty standard markdown syntax, there are a few additional
changes worth noting.

### Page break

Following syntax is used for page break:

```md
---
```

Everything below that line, will render on a new page.

### Styles

Each template can define some styles in `<TEMPLATE_DIR>/css/styles.css`. These
can be applied to whole pages, or to the individual components.

#### Pages

Each page can use different style. In our templates, we typically have three
styles:

* style for the first page,
* default style for the content pages,
* style for the list page.

```md
class: center, middle, intro

## DOCUMENT_TITLE
---
```

#### Components

Styles can also be applied to individual components (such as: code blocks,
images, text). For example, following syntax can be used to apply `center`
style for some text:

```md
.center[Text to be centered]
```

#### Common styles

There are some common and useful styles you will face in many of templates.
Some of them are described below. A full list of styles definition for the
given template can be found in: `<TEMPLATE_DIR>/css/styles.css` file.

* Common way of inserting centered image:

> In this case image will be reduced to 15% in size. There are multiple styles
> for image size defined, typically with 5% step.

```md
.center[.image-15[![]image.png)])]
```

* Text centered in a single column:

```md
.column-1[
.middle-1[your-text]
]
```

* Text in two columns:

```md
.column-2[
.left-2[your-text]
.right-2[your-text]
]
```

* Text in 3 columns:

```md
.column-3[
.left-3[your-text]
.middle-3[your-text]
.right-3[your-text]
]
```

* Text in 4 columns:

```md
.column-4[
.left-4[your-text]
.left-middle-4[your-text]
.right-middle-4[your-text]
.right-4[your-text]
]
```

* Footnote:

> A footnote to be displayed on the bottom of the slide. To be used for
> providing source of information, for example.

```md
.footnote[Source: https://wikipedia.org]
```

## Usage

### Create HTML file

To use `remark-templates`, it should be added as a submodule to your
documentation/presentation repository. If it has not been done already, you
should do that with:

```shell
git submodule add git@github.com:3mdeb/remark-templates.git remark-templates
```

* Copy the template markdown file from target templates directory, e.g.:

```shell
cp 3mdeb-presentation-template/3mdeb-presentation-template.md title-of-your-choice.md
```

* Execute the `create-html.sh` script for a selected
  [template](#available-templates):

```md
./remark-templates/scripts/create-html.sh 3mdeb-presentation-template \
  "Title of Your Presentation" title-of-your-choice.md
```

* Now you can keep editing your `title-of-your-choice.md` file with content,
  while reviewing the rendered output form HTML file as shown in the next
  section.

### Preview the HTML file

> Chrome / Chromium browser is recommended

* Start the HTTP server:

  ```python
  python -m http.server 8080
  ```

* Open rendered HTML in browser, using the `http://127.0.0.1:8080/` URL

## Generate PDF file

The ultimate goal of these templates is usually to generate a PDF file from
markdown content.

### Manual

> Chrome / Chromium browser is recommended

* Open the preview in browser as shown above, and simply print to file
    - make sure to check the `Background graphics` under `More settings`

### Automated

You can also use a scripted way to generate the PDF.

#### Requirements

* [Docker](https://docs.docker.com/engine/install/ubuntu/) installed
* `Python` installed (for setting up the HTTP server)
* the `<title>` tag in each HTML file should be present - the printed filename
  will be based on that (spaces will be replaced with underscores)

#### Printing

* Go to the directory with your HTML files

* Print everything everything from current directory and subdirectories:

```shell
./remark-templates/scripts/print-pdfs.sh .
```

* The resulting HTML files could be found in the `pdf` subdirectory

* Run the script with no arguments to get more information on available options

## Known Issues

* When printing from the browser, the font on the first page may be too thick.
    - to fix this refresh the page or clear the cache
