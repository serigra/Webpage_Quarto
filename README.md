# Instructions


## Styles, Fonts and Colors

Über .css Files kann die Website und jede Subsite beliebig angepasst/ formattiert werden.

- für "**HOME**"-Page: im root folder im File "styles.css"" können title, subtitles etc. formatiert werden.
- für "**ABOUT**"-Page: separates .css-File: "about/styles_about.css" --> muss ebenfalls im about.qmd file mit `css: styles_about.css` referenziert werden.
- "**PUBLICATIONS**": 
    - on this site, all publications are listed based on a "listing"-layout, as defined in the yaml-header. Instead of using one of the three build in type of listings, I used customized display of the items, which is defined in the publications/_ejs/publications.ejs (ejs = embedded java script). Here you arrange the displayed items (title, author, journal, URL Link, image, etc.) according to your own needs. It is important to refer to the .ejs file in the index.qmd file using `template: _ejs/publications.ejs` in the yaml-header under `listing`.
    - the style, fonts and colors of the listing page are defined in the `publications/styles_publications.css` file.
    - the style, fonts and colors of the individual sites of each publication (i.e. abstracts), are defined in `styles_publications_individual.css`



## Page Layout/ Widths of Columns

- in "_quarto.yml": see `grid:` with `sidebar-width: 200px` etc.


## Academicons

To be able to use non-built-in "academicons" --\> navigate to your root folder of website and install the extension in the particular project:

In terminal:

```         
cd 07_Webpage_Quarto     
quarto install extension schochastics/academicons
```

This adds a new folder \_extensions/stochastics/acadeicons in the root folder of the quarto (website) project.

Example to add Icon:

```         
- text: "{{< ai researchgate >}}"      
  aria-label: ResearchGate
  href: https://www.researchgate.net/profile/Sereina-Graber
```


